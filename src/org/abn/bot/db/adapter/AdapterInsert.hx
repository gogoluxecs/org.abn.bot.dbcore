package org.abn.bot.db.adapter;

import org.abn.bot.db.adapter.ActionAdapter.Adaptee;

/**
 * Adapter for insert operation
 */
class AdapterInsert extends ActionAdapter
{
  override public function execute():String
  {
    var val:String = this.context.get("adapter.name");
    var i : Adaptee;
    
    switch(val)
    {
      case ActionAdapter.TYPE_MYSQL:
        i = { a : new org.abn.bot.db.adapter.mysql.DispatchInsertOperation(this.context) };
        return i.a.execute();
        
      case ActionAdapter.TYPE_NEO4J:
        i = { a : new org.abn.bot.db.adapter.neo.DispatchInsertOperation(this.context) };
        return i.a.execute();
        
      default:
        throw "Unsupported adapter";
    }
  }
}
