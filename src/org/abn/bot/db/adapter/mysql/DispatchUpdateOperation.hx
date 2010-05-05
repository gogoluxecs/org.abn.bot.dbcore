package org.abn.bot.db.adapter.mysql;

import org.abn.bot.db.adapter.ActionAdapter;

class DispatchUpdateOperation extends ActionAdapter
{
  public function execute():String
  {
    return "update " + this.context.get("signature.name");
  }
}
