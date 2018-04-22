/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************/

import Test
@testable import HTTP
@testable import MVC

class ApplicationTests: TestCase {
    func testPartialUrl() {
        final class TestController: Controller, Inject {
            static func setup(router: MVC.Router<TestController>) throws {
                router.route(get: "/:name/id/:number", to: handler)
            }

            struct Page: Decodable {
                let name: String
                let number: Int
            }

            func handler(page: Page) -> String {
                return "\(page.name) - \(page.number)"
            }
        }

        scope {
            let application = HTTP.Application(basePath: "/api")
            let mvcApplication = MVC.Application(basePath: "/v1")
            try mvcApplication.addController(TestController.self)
            application.addApplication(mvcApplication)

            let request = Request(url: "/api/v1/news/id/2", method: .get)
            let response = try application.process(request)
            assertEqual(response.status, .ok)
        }
    }
}
