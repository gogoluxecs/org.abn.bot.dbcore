package org.abn.bot.db.operation;

import neko.Web;
import org.abn.bot.operation.BotOperation;

/**
 * Operation runs only in HTTP context
 */
class Stop extends BotOperation
{
  /**
   *
   * @access public
   * @return String
   */
  override public function execute(params:Hash<String>):String
  {
    if (!this.botContext.has("started"))
			return "<response>not started</response>";
		
		this.botContext.set("started", null);
		this.botContext.closeXMPPConnection();
		
		Web.cacheModule(null);
		trace("bot db stopped");
		return "<response>stopped</response>";
  }
}
