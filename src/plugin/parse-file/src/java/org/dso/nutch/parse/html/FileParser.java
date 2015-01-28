package org.dso.nutch.parse.html;

import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.DocumentFragment;
import org.apache.hadoop.conf.Configuration;
import org.apache.nutch.metadata.Metadata;
import org.apache.nutch.parse.HTMLMetaTags;
import org.apache.nutch.parse.HtmlParseFilter;
import org.apache.nutch.parse.ParseResult;
import org.apache.nutch.protocol.Content;
import org.apache.nutch.util.NutchConfiguration;

public class FileParser implements HtmlParseFilter {
	public static final Logger LOG = LoggerFactory.getLogger( FileParser.class ) ;

	public static final String FILE_EXTENSION = "html";
	public static final String FILE_DIRECTORY_PROPERTY_NAME = "fileparser.directory";

	private static final SimpleDateFormat format = new SimpleDateFormat(
			"yyyyMMdd-HHmmss");

	private Configuration conf;

	public void setConf(Configuration conf) {
		this.conf = conf;
	}

	public Configuration getConf() {
		return this.conf;
	}

	public ParseResult filter(Content content, ParseResult parseResult,
			HTMLMetaTags metaTags, DocumentFragment doc) {
		final String fileDirectory = conf.get(FILE_DIRECTORY_PROPERTY_NAME);

		boolean directoryExist = false;
		if (fileDirectory != null) {
			File d = new File(fileDirectory);
			if (!d.exists()) {
				directoryExist = d.mkdir();
			} else {
				directoryExist = d.isDirectory() ;
			}
			
			LOG.info("File directory to store output: " + d.toPath().toAbsolutePath().toString() ) ;
		}

				
		try {
			final String timestamp = format.format(new Date());

			String fileName = URLEncoder.encode(content.getUrl(), "UTF-8");
			
			//String fileName = URLEncoder.encode(content.getUrl(), "UTF-8") + "-" + timestamp + "." + FILE_EXTENSION;

			if (directoryExist)
				fileName = fileDirectory + "/" + fileName;

			final File file = new File(fileName);

			final FileOutputStream fos = new FileOutputStream(file);

			final BufferedOutputStream bos = new BufferedOutputStream(fos);

			//if (LOG.isInfoEnabled())
				LOG.info("FileParser: writing HTML from url: "
						+ content.getUrl() + " to file: " + fileName);

			bos.write(content.getContent());
			bos.close();
			fos.close();

		} catch (IOException e) {
			if (LOG.isErrorEnabled()) {
				LOG.error(e.getMessage());
			}
		}

		return parseResult;
	}

	public static void main(String[] args) throws Exception {
		// LOG.setLevel(Level.FINE);
		String name = args[0];
		String url = "file:" + name;
		File file = new File(name);
		byte[] bytes = new byte[(int) file.length()];
		DataInputStream in = new DataInputStream(new FileInputStream(file));
		in.readFully(bytes);
		in.close();
		Configuration conf = NutchConfiguration.create();
		FileParser parser = new FileParser();
		parser.setConf(conf);
		Content content = new Content(url, url, bytes, "text/html",
				new Metadata(), conf);
		ParseResult parseResult = parser.filter(content, null, null, null);
	}
}
