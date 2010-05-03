package org.abn.bot.db.action.mysql.insert;

class Model
{
  private var params:Hash<String>;

  public function new(params:Hash<String>)
  {
    this.params = params;
  }

  public function execute():String
  {
    // initialize required operations
  
    this.initModel();
    this.initContent();
    this.initModelAndContent();
  }
}
