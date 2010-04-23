package org.abn.bot.db.operation;

import org.abn.uberTora.UberToraContext;
import org.abn.bot.operation.BotOperation;

class Stop extends BotOperation
{
	public override function execute(params:Hash<String>):String
	{		
	  var templateName:String = haxe.Resource.getString("status_report");
	  var t = this.botContext.getRender(templateName);
	
		if (!this.botContext.has("started"))
			return t.execute({ status_report : "not started" });
		
		this.botContext.set("started", null);
		this.botContext.closeXMPPConnection();
		UberToraContext.redirectRequests(null);
		
    return t.execute({ status_report : "stopped"});
	}
}
