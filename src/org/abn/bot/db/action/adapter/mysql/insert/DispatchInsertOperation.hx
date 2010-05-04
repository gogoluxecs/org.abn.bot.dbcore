package org.abn.bot.db.action.adapter.mysql.insert;

import org.abn.bot.db.action.ActionAdapter;

class DispatchInsertOperation extends ActionAdapter
{
  public function execute():String
  {
    return this.context.get("signature.name");
  }
}
