package ;

import js.node.http.ServerResponse;
import js.node.http.IncomingMessage;
import js.node.Http;

class ProxyServer
{
	static inline var PORT:Int = 8000;
	static inline var URL:String = "127.0.0.1";

	public static function main()
	{
		new ProxyServer(PORT, URL);
	}

	public function new()
	{
		Http.createServer(onRequest).listen(PORT, URL);
		trace('Server running at http://127.0.0.1:3000/');
	}

	function onRequest(request:IncomingMessage, response:ServerResponse):Void
	{
		response.writeHead(200, {'Content-Type': 'text/plain'});
		response.end('Hello World\n');
	}
}
