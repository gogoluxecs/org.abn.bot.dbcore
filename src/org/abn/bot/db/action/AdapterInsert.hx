package org.abn.bot.db.action;

import org.abn.bot.db.action.ActionAdapter;
import org.abn.bot.db.action.adapter.mysql.insert.DispatchInsertOperation;

class AdapterInsert extends ActionAdapter
{
  public function execute():String
  {
    var val:String = this.context.get("adapter.name");
  
    switch(val)
    {
      case ActionAdapter.TYPE_MYSQL:
        var i:DispatchInsertOperation =  new DispatchInsertOperation(this.context);
        return i.execute();
        
      default:
        throw "Unsupported adapter";
    }
  }
}
