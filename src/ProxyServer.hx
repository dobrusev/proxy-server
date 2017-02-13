package ;

import js.node.Http;
import js.node.http.ServerResponse;
import js.node.http.IncomingMessage;

class ProxyServer
{
	static inline var PORT:Int = 3000;
	static inline var URL:String = "127.0.0.1";

	public static function main()
	{
		new ProxyServer();
	}

	public function new()
	{
		Http.createServer(onRequest).listen(PORT, URL);
		trace('Server running at http://127.0.0.1:3000/');
	}

	function onRequest(request:IncomingMessage, response:ServerResponse):Void
	{
		trace('serve: ' + request.url);

		var options = {
			hostname: "to be done", // parse it from the url
			port: 80, // parse protocol http -> 80, https -> 443
			path: request.url,
			method: request.method
		};

		var proxy = Http.request(options, function (proxyResponse:IncomingMessage) {
			proxyResponse.pipe(response, {
				end: true
			});
		});

		request.pipe(proxy, {
			end: true
		});
	}
}
