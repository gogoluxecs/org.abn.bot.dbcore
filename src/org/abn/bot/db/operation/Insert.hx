package org.abn.bot.db.operation;

import org.abn.bot.db.action.ActionContext;
import org.abn.bot.operation.BotOperation;
import org.abn.bot.db.action.AdapterInsert;

private typedef InsertAction = {
  var i : AdapterInsert;
}

class Insert extends BotOperation
{
	public override function execute(params:Hash<String>):String
	{
	  //var templateName:String = haxe.Resource.getString("status_report");
	  //var t = this.botContext.getRender(templateName);

    var actionContext:ActionContext = new ActionContext(this.botContext);
    actionContext.setParams(params);    
    
    var a : InsertAction = { i : new AdapterInsert(actionContext) };
    return a.i.execute();
    
    //return t.execute({ status_report : params});
	}
}
