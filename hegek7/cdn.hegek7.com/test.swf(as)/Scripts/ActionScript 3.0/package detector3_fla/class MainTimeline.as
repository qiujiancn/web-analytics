//class MainTimeline
package detector3_fla 
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import flash.system.*;
    import flash.utils.*;
    
    public dynamic class MainTimeline extends flash.display.MovieClip
    {
        public function MainTimeline()
        {
            super();
            addFrameScript(0, frame1);
            return;
        }

        public function checkIsInView():Boolean
        {
            return viewState === IN_VIEW;
        }

        function frame1():*
        {
            Security.allowDomain("*");
            Security.allowInsecureDomain("*");
            this.addEventListener(Event.ENTER_FRAME, checkFrameRate);
            prevTime = 0;
            addEventListener(Event.ENTER_FRAME, registerExternalCallbacks);
            return;
        }

        public function checkFrameRate(arg1:flash.events.Event):void
        {
            var loc1:*=undefined;
            var loc2:*=undefined;
            loc1 = getTimer();
            loc2 = loc1 - prevTime;
            viewState = loc2 > 400 ? OUT_OF_VIEW : IN_VIEW;
            prevState = viewState;
            prevTime = loc1;
            return;
        }

        public function registerExternalCallbacks(arg1:flash.events.Event):void
        {
            removeEventListener(Event.ENTER_FRAME, registerExternalCallbacks);
            if (ExternalInterface.available) 
            {
                ExternalInterface.addCallback("test", checkIsInView);
            }
            return;
        }

        public const OUT_OF_VIEW:Object="out of view";

        public const IN_VIEW:Object="in view";

        public var viewState:Object;

        public var prevState:Object;

        public var prevTime:Object;
    }
}


