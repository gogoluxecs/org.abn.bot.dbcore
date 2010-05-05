package org.abn.bot.db.adapter.mysql.insert;

import org.abn.bot.db.adapter.ActionAdapter;
import hxjson2.JSON;

class Model extends ActionAdapter
{
  /**
   * Parsing model operation 
   *
   * @access public
   * @return String
   */
  override public function execute():String
  {
    var templateName:String = haxe.Resource.getString("status_report");
	  var t = this.context.getRender(templateName);

    var params:Hash<String> = this.context.getParams();
    var json:Dynamic = JSON.decode(params.get("model"));
    
    return t.execute({ status_report : "true" });
  }
}
