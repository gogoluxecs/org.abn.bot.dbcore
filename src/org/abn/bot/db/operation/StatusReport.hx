﻿package org.abn.bot.db.operation;

import org.abn.bot.operation.BotOperation;

class StatusReport extends BotOperation
{
	public override function execute(params:Hash<String>):String
	{
	  var templateName:String = haxe.Resource.getString("status_report");
	  var t = this.botContext.getRender(templateName);
	
		return t.execute({ status_report : "<online />"});
	}
}
