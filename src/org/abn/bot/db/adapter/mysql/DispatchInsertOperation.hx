package org.abn.bot.db.adapter.mysql;

import org.abn.bot.db.adapter.ActionAdapter;
import org.abn.bot.db.adapter.mysql.insert.Model;

class DispatchInsertOperation extends ActionAdapter
{
  private var params:Hash<String>;

  override public function execute():String
  {
    var params : Hash<String> = this.context.getParams();

    if(params.exists("model") && params.get("model").length > 0)
    {
      var i : Model = new Model(this.context);
      return i.execute();
    }
  
    var templateName:String = haxe.Resource.getString("status_report");
	  var t = this.context.getRender(templateName);
  
    return t.execute({ status_report : params});
  }
}
