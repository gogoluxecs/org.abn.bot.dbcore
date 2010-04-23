package org.abn.bot.db;

import org.abn.bot.BotContext;
import org.abn.neko.AppContext;

import org.abn.bot.db.operation.Start;
import org.abn.bot.db.operation.Stop;
import org.abn.bot.db.operation.StatusReport;

import org.abn.bot.db.operation.Insert;

class BotService extends BotContext
{
  public function new(context:AppContext)
  {
    super(context);
  }
}
