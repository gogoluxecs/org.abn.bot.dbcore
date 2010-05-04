package org.abn.bot.db.action;

import org.abn.bot.db.action.ActionContext;

/**
 * Object adapter class
 */
class ActionAdapter
{
  public var context:ActionContext;
  
  static public var TYPE_MYSQL:String = "MySQL";
  static public var TYPE_NEO4J:String = "Neo4J";

  /**
   *
   * @access public
   * @return Void
   */
  public function new(context:ActionContext)
  {
    this.context = context;   
  }
  
  /**
   * @access public
   * @return String
   */
  public function getAdapter():String
  {
    return this.context.get("adapter.name");
  }
  
  
}
