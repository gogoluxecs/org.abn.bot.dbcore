package org.abn.bot.db.action;

import org.abn.bot.BotContext;

/**
 * Specific context for actions.
 * @todo test with removed extends BotContext and use is as a new instance.
 */
class ActionContext extends BotContext
{
  public var context:BotContext;
  private var webParams:Hash<String>;

  /**
   * Initializes parent content and extends it
   */  
 	public function new(context:BotContext) 
	{
    super(context);
    this.context = context;
	}
	
  /**
   * Returns webParams Hash
   *
   * @access public
   * @return Hash<String>
   */
	public function getParams():Hash<String>
	{
    return this.webParams;          
	}
	
  /**
   * Sets webParams Hash
   * 
   * @access public
   * @return Void
   */
	public function setParams(v : Hash<String>):Void
	{
	  this.webParams = v;
	}
}
