/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Offset : Codable {
	let imsak : Int?
	let fajr : Int?
	let sunrise : Int?
	let dhuhr : Int?
	let asr : Int?
	let maghrib : Int?
	let sunset : Int?
	let isha : Int?
	let midnight : Int?

	enum CodingKeys: String, CodingKey {

		case imsak = "Imsak"
		case fajr = "Fajr"
		case sunrise = "Sunrise"
		case dhuhr = "Dhuhr"
		case asr = "Asr"
		case maghrib = "Maghrib"
		case sunset = "Sunset"
		case isha = "Isha"
		case midnight = "Midnight"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		imsak = try values.decodeIfPresent(Int.self, forKey: .Imsak)
		fajr = try values.decodeIfPresent(Int.self, forKey: .Fajr)
		sunrise = try values.decodeIfPresent(Int.self, forKey: .Sunrise)
		dhuhr = try values.decodeIfPresent(Int.self, forKey: .Dhuhr)
		asr = try values.decodeIfPresent(Int.self, forKey: .Asr)
		maghrib = try values.decodeIfPresent(Int.self, forKey: .Maghrib)
		sunset = try values.decodeIfPresent(Int.self, forKey: .Sunset)
		isha = try values.decodeIfPresent(Int.self, forKey: .Isha)
		midnight = try values.decodeIfPresent(Int.self, forKey: .Midnight)
	}

}