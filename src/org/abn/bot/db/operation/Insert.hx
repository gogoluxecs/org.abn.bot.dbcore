package org.abn.bot.db.operation;

import org.abn.bot.db.action.Model;
import org.abn.bot.db.action.ActionContext;
import org.abn.bot.operation.BotOperation;

private typedef InsertAction = {
  var i : org.abn.bot.db.action.Insert;
}

class Insert extends BotOperation
{
	public override function execute(params:Hash<String>):String
	{
	  var templateName:String = haxe.Resource.getString("status_report");
	  var t = this.botContext.getRender(templateName);

    var actionContext:ActionContext = new ActionContext(this.botContext);

    /*
    if(params.exists("init_model"))
    {
      var a:Model = new Model(params);
      return a.execute();
    }
    */
    
    var a : InsertAction = { i : new org.abn.bot.db.action.Insert() };
    return a.i.execute();
    
    return t.execute({ status_report : params});
	}
}
