package org.abn.bot.db.action;

import org.abn.bot.BotContext;
import org.abn.neko.AppContext;

class ActionContext extends BotContext
{
  private var context:BotContext;
  private var params:Hash<String>;

 	public function new(context:BotContext) 
	{
    super(context);
    this.context = context;
	}
}
