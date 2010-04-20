package org.abn.bot.db;

import org.abn.bot.BotContext;
import org.abn.bot.operation.BotOperationFactory;
import org.abn.neko.AppContext;
import org.abn.neko.xmpp.XMPPContext;

// import common required bot operations
import org.abn.bot.db.operation.Start;
//import org.abn.bot.db.operation.Stop;//import org.abn.bot.db.operation.StatusReport;

class BotService extends BotContext
{
  public function new(context:AppContext)
  {
    super(context);
  }
}
