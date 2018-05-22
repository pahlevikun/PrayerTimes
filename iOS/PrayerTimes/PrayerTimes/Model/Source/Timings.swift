/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Timings : Codable {
	let fajr : String?
	let sunrise : String?
	let dhuhr : String?
	let asr : String?
	let sunset : String?
	let maghrib : String?
	let isha : String?
	let imsak : String?
	let midnight : String?

	enum CodingKeys: String, CodingKey {

		case fajr = "Fajr"
		case sunrise = "Sunrise"
		case dhuhr = "Dhuhr"
		case asr = "Asr"
		case sunset = "Sunset"
		case maghrib = "Maghrib"
		case isha = "Isha"
		case imsak = "Imsak"
		case midnight = "Midnight"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		fajr = try values.decodeIfPresent(String.self, forKey: .Fajr)
		sunrise = try values.decodeIfPresent(String.self, forKey: .Sunrise)
		dhuhr = try values.decodeIfPresent(String.self, forKey: .Dhuhr)
		asr = try values.decodeIfPresent(String.self, forKey: .Asr)
		sunset = try values.decodeIfPresent(String.self, forKey: .Sunset)
		maghrib = try values.decodeIfPresent(String.self, forKey: .Maghrib)
		isha = try values.decodeIfPresent(String.self, forKey: .Isha)
		imsak = try values.decodeIfPresent(String.self, forKey: .Imsak)
		midnight = try values.decodeIfPresent(String.self, forKey: .Midnight)
	}

}