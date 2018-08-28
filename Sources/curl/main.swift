import HTTP

struct CurlError: Error {}

struct SlackTest: Codable {
    let ok: Bool
}

let worker = MultiThreadedEventLoopGroup(numberOfThreads: 1)

let request = HTTPRequest(method: .GET, url: "/api/api.test")
let client = try HTTPClient.connect(scheme: .https, hostname: "slack.com", port: 443, on: worker).wait()
let response = try client.send(request).wait()

let decoder = JSONDecoder()
guard let data = response.body.data else {
    throw CurlError()
}
let test = try decoder.decode(SlackTest.self, from: data)
if test.ok {
    print("Slack is up! 🎉")
} else {
    print("Slack is down!!! 📟")
}

