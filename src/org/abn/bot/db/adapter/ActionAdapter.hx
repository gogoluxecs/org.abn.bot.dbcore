package org.abn.bot.db.adapter;

typedef Adaptee = {
  var a : Dynamic;
}

/**
 * Object adapter class
 */
class ActionAdapter
{
  public var context:ActionContext;
  
  // Mapx adapter types    
  static public var TYPE_MYSQL:String = "MySQL";
  static public var TYPE_NEO4J:String = "Neo4J";

  /**
   * @access public
   * @return Void
   */
  public function new(context:ActionContext)
  {
    this.context = context;   
  }
  
  /**
   * Returns context adapter
   *
   * @access public
   * @return String
   */
  public function getAdapter():String
  {
    return this.context.get("adapter.name");
  }
  
  /**
   * Abtract execute function
   *
   * @access public
   * @return String
   */
  public function execute():String
  {
    return throw Type.getClassName(ActionAdapter) + ": abstract execute";
  }
}
