//: Playground - noun: a place where people can play

import Cocoa
import XCPlayground

var json = "[{\"id\":1,\"code\":\"en\",\"title\":\"ENG\",\"created_at\":\"2013-09-30T18:09:58.000Z\",\"updated_at\":\"2014-07-10T10:34:04.000Z\",\"site_title\":\"Blaahölöl\",\"position\":1,\"default_language\":false,\"url\":\"http://priit.voog.computer/admin/api/languages/1\",\"move_url\":\"http://priit.voog.computer/admin/api/languages/1/move\",\"contents_url\":\"http://priit.voog.computer/admin/api/languages/1/contents\",\"pages_url\":\"http://priit.voog.computer/admin/api/pages?language_id=1\"},{\"id\":4,\"code\":\"et\",\"title\":\"EST\",\"created_at\":\"2013-10-02T09:09:20.000Z\",\"updated_at\":\"2014-01-20T13:01:53.000Z\",\"site_title\":\"DEV\",\"position\":2,\"default_language\":false,\"url\":\"http://priit.voog.computer/admin/api/languages/4\",\"move_url\":\"http://priit.voog.computer/admin/api/languages/4/move\",\"contents_url\":\"http://priit.voog.computer/admin/api/languages/4/contents\",\"pages_url\":\"http://priit.voog.computer/admin/api/pages?language_id=4\"},{\"id\":5,\"code\":\"de\",\"title\":\"GER\",\"created_at\":\"2013-10-02T09:27:04.000Z\",\"updated_at\":\"2013-10-02T09:27:04.000Z\",\"site_title\":\"Deutsch\",\"position\":3,\"default_language\":false,\"url\":\"http://priit.voog.computer/admin/api/languages/5\",\"move_url\":\"http://priit.voog.computer/admin/api/languages/5/move\",\"contents_url\":\"http://priit.voog.computer/admin/api/languages/5/contents\",\"pages_url\":\"http://priit.voog.computer/admin/api/pages?language_id=5\"},{\"id\":6,\"code\":\"es\",\"title\":\"ESP\",\"created_at\":\"2013-10-02T14:20:58.000Z\",\"updated_at\":\"2013-10-02T14:20:58.000Z\",\"site_title\":\"Espanjol\",\"position\":4,\"default_language\":false,\"url\":\"http://priit.voog.computer/admin/api/languages/6\",\"move_url\":\"http://priit.voog.computer/admin/api/languages/6/move\",\"contents_url\":\"http://priit.voog.computer/admin/api/languages/6/contents\",\"pages_url\":\"http://priit.voog.computer/admin/api/pages?language_id=6\"},{\"id\":7,\"code\":\"fr\",\"title\":\"FRA\",\"created_at\":\"2013-10-02T19:22:45.000Z\",\"updated_at\":\"2013-10-02T19:22:45.000Z\",\"site_title\":\"Francais\",\"position\":5,\"default_language\":false,\"url\":\"http://priit.voog.computer/admin/api/languages/7\",\"move_url\":\"http://priit.voog.computer/admin/api/languages/7/move\",\"contents_url\":\"http://priit.voog.computer/admin/api/languages/7/contents\",\"pages_url\":\"http://priit.voog.computer/admin/api/pages?language_id=7\"}]"


if let dataFromString = json.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
    let json = JSON(data: dataFromString)
    
    json[0]["title"].stringValue
    json[0]["code"].string
}
