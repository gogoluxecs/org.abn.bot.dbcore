package org.abn.bot.db.operation;

import haxe.Stack;
import neko.vm.Thread;
import org.abn.bot.operation.BotOperation;
import org.abn.neko.xmpp.XMPPContext;
import org.abn.bot.db.Main;

import org.abn.uberTora.UberToraContext;
import xmpp.Message;
import haxe.xml.Fast;

class Start extends BotOperation
{		
	private var httpThread:Thread;
	
	public override function execute(params:Hash<String>):String
	{
    var templateName = haxe.Resource.getString("status_report");
    var t = this.botContext.getRender(templateName);
	
		if (this.botContext.has("started"))
			return t.execute({ status_report : "already started" });
			
		this.httpThread = Thread.current();
			
		this.botContext.openXMPPConnection(onConnected, onConnectFailed, onDisconnected);
		
		UberToraContext.redirectRequests(Main.handleRequests);
		this.botContext.set("started", true);
		
		return t.execute({ status_report : Thread.readMessage(true) });
	}
	
	private function onConnectFailed(reason:Dynamic):Void
	{
		this.botContext.set("started", null);
		trace("xmpp connect failed "+reason);
	}
	
	private function onConnected():Void
	{
		trace(this.botContext.get("signature.name") + " started");
		this.httpThread.sendMessage("started");
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
