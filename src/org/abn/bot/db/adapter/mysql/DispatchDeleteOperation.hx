package org.abn.bot.db.adapter.mysql;

import org.abn.bot.db.adapter.ActionAdapter;

class DispatchDeleteOperation extends ActionAdapter
{
  public function execute():String
  {
    return "delete " + this.context.get("signature.name");
  }
}
