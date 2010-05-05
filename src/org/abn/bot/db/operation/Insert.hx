package org.abn.bot.db.operation;

import org.abn.bot.operation.BotOperation;
import org.abn.bot.db.adapter.ActionContext;
import org.abn.bot.db.adapter.AdapterInsert;

class Insert extends BotOperation
{
	public override function execute(params:Hash<String>):String
	{
    var actionContext:ActionContext = new ActionContext(this.botContext);
    
    var t:String = params.get("model");
    actionContext.setParams(params);
   
    var a:AdapterInsert = new AdapterInsert(actionContext);
    return a.execute();
	}
}
