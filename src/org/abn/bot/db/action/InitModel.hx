package org.abn.bot.db.action;

class InitModel
{
  private var params:Hash<String>;

  public function new(params:Hash<String>)
  {
    this.params = params;
  }

  public function execute():String
  {
    return "<response>hallo from Init model action</response>";
  }
}
