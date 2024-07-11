package engine.internal.api;

#if hxgamejolt_api
    import hxgamejolt.GameJolt;
#end

class Gamejolt extends GameJolt{
    private static var jolt = {
        user: '',
        token: '',
        id: '',
        key: ''
    };

    #if hxgamejolt_api
        /**
         * This will launch Game Jolt API
         * In this Array<String> Set the API
         * @param api1[0] User's Name
         * @param api1[1] User's Token
         * @param api2[0] Game ID
         * @param api2[1] PrivateKey
        */
        public function new(?api1:Array<String>, ?api2:Null<Array<String>>){
            var i1 = api1;
            var i2 = api2;
            jolt.user = (i1[0] != null ? i1[0]: '');
            jolt.token = (i1[1] != null ? i1[1] : '');
            jolt.id = (i2[0] != null ? i2[0] : Persist.gamejoltAPI.id);
            jolt.key = (i2[1] != null ? i2[1]: Persist.gamejoltAPI.key);
        }

        public static function initialize(){
            if (!GameJolt.initialized){
                if (jolt.id != '' && jolt.key != ''){
                    GameJolt.init(jolt.id, jolt.key);
                    #if debug
                        Debug.log('Gamejolt API Initialize');
                    #end
                }else{
                    #if debug
                        Debug.log('Gamejolt API Failed Initialize', 'error');
                    #end
                }
            }else{
                #if debug
                    Debug.log('Gamejolt API Running');
                #end
            }
        }

        public static function api(){
            GameJolt.authUser(jolt.user, jolt.token, {
                onSucceed: function(data:Dynamic):Void{
                    // your code
                }, onFail: function(message:String):Void{
                    Debug.log(message);
                }
            });
            
            GameJolt.fetchUser(jolt.user, [], {
                onSucceed: function(data:Dynamic):Void{
                    // your code
                }, onFail: function(message:String):Void{
                    Debug.log(message);
                }
            });
        }
    #end
}