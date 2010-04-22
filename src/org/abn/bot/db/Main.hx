package org.abn.bot.db;

import haxe.Stack;
import haxe.xml.Fast;
import neko.io.File;
import neko.Lib;
import neko.Web;
import org.abn.Context;
import org.abn.ContextParser;
import org.abn.neko.AppContext;
import org.abn.uberTora.ClientRequestContext;
import org.abn.uberTora.UberToraContext;

class Main 
{
  static private var service:BotService;

  static public function main()
  {
    var parser:ContextParser = new ContextParser();
	  var xml:Xml = Xml.parse(File.getContent(Web.getCwd() + "assets/config.xml"));
	  var fast:Fast = new Fast(xml.firstElement());
	  var context:Context = parser.getContext(fast);
	
    service = new BotService(new AppContext(context.getProperties()));
	  service.executeOperation(Web.getURI().substr(1), Web.getParams());
  }
  
  static public function handleRequests(request:Dynamic)
  {
    var requestContext:ClientRequestContext = UberToraContext.getAsClientRequestContext(request);
    
		try
		{
			requestContext.sendResponse(service.executeOperation(requestContext.getURI().substr(1),requestContext.getParams()));
		}
		catch (e:Dynamic)
		{
			requestContext.sendResponse(e);
			trace(Stack.toString(Stack.exceptionStack()));
		}
  }
}
