package org.abn.bot.db.adapter.neo;

import org.abn.bot.db.adapter.ActionAdapter;

class DispatchInsertOperation extends ActionAdapter
{
  override public function execute():String
  {
    return "insert neo " + this.context.get("adapter.name");
  }
}
