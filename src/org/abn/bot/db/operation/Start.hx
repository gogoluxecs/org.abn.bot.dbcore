package org.abn.bot.db.operation;

import org.abn.bot.db.Main;
import org.abn.neko.xmpp.XMPPContext;
import org.abn.uberTora.UberToraContext;
import org.abn.bot.operation.BotOperation;
import org.abn.bot.operation.BotOperationFactory;

import neko.vm.Thread;
import haxe.Stack;
import haxe.xml.Fast;
import haxe.Template;
import neko.Web;
import xmpp.Message;

/**
 * Operation runs only in HTTP context
 */
class Start extends BotOperation
{
	private var thread:Thread;
	
  /**
   *
   * @access public
   * @return String
   */
	override public function execute(params:Hash<String>):String
	{
    var templateName:String = haxe.Resource.getString("status_report");
    var t = new haxe.Template(templateName);
	
		if (this.botContext.has("started"))
			return t.execute({ status_report : "Already started"});
			
		this.thread = Thread.current();
		
		// init XMPP
    this.botContext.openXMPPConnection(onConnected, 
      onConnectFailed, onDisconnected);	

		UberToraContext.redirectRequests(Main.handleRequests);
		this.botContext.set("started", true);
		
		var status:String = Thread.readMessage(true);
		return t.execute({ status_report : "Started"});
	}
	
	private function onConnected():Void
	{
		trace("actionfeed connected");
		
		this.thread.sendMessage("started");
	}
	
	private function onConnectFailed(reason:Dynamic):Void
	{
		trace("Unsuccessfull connection" + reason);	
		this.thread.sendMessage("failed");
	}
	
	private function onDisconnected():Void
	{
		if (this.botContext.has("started"))
		{
			trace("trying to reconnect...");
			this.botContext.openXMPPConnection(onConnected, onConnectFailed, onDisconnected);
		}
	}
}
