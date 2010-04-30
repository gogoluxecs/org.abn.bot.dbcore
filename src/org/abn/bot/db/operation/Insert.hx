package org.abn.bot.db.operation;

import org.abn.bot.db.action.InitModel;
import org.abn.bot.operation.BotOperation;

class Insert extends BotOperation
{
	public override function execute(params:Hash<String>):String
	{
	  var templateName:String = haxe.Resource.getString("status_report");
	  var t = this.botContext.getRender(templateName);

    if(params.exists('init_model'))
    {
      var a:InitModel = new InitModel(params);
      return a.execute();
    }

    return t.execute({ status_report : params});
	}
}
