//
//  Question.swift
//  DMA064_PersonalityTestFortune
//
//  Created by Dana Runge on 5/1/25.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var weight: Float
    var width: Float?
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

enum ElementType: Character {
    case earth = "🪨", air = "🌬️", fire = "🔥", water = "🌊"
    var definition: String {
        switch self {
        case .earth:
            return "Your primary element is Earth. You are most comfortable in your home. "
            + "When you need to recharge return to your nest, and practice a grounding ritual. "
            + "If you do that, the Earth's energy will bring you comfort and rejuvenation. "
            + "However, be sure to venture away from your home from time to time "
            + "whenever it's time to receive new wisdom and insight."
        case .air:
            return "Your primary element is Air. "
            + "Like the winds you can be variable, following where your energies call you to go. "
            + "Each waning Moon, do a deep soul search to divine which direction you are called to go, "
            + "to ensure that your boundless energy is utilized towards your best intentions."
        case .fire:
            return "Your primary element is Fire. Passion describes you. Passion drives you. "
            + "And if you're not careful, passion can burn you. "
            + "Your friends and family appreciate your passionate nature, "
            + "and enjoy that you are generous with your energy. "
            + "Be aware, however, of psychic vampires, "
            + "they will try to steal your passion and energy to their own purposes."
        case .water:
            return "Your primary element is Water. Like a river your flexibility is your greatest gift. "
            + "Also like a river powering a water wheel, when times are good, "
            + "you can utilize unlimited energy. But, when times are bad, "
            + "you still have the persistence necessary to wear down any rocks that get in your way. "
            + "Be aware of any thoughts that can dam up your energy flow."
        }
    }
}

struct AnswerWeights {
    var earth: Float? // Earth
    var air: Float? // Air
    var fire: Float? // Fire
    var water: Float? // Water
    init(earth: Float? = nil, air: Float? = nil, fire: Float? = nil, water: Float? = nil) {
        self.earth = earth
        self.air = air
        self.fire = fire
        self.water = water
    }
    func weightAndSum(weight: Float, sum: AnswerWeights) -> AnswerWeights {
        return AnswerWeights.init(
            earth: (self.earth ?? 0.0) + (sum.earth ?? 0.0) * weight,
            air: (self.air ?? 0.0) + (sum.air ?? 0.0) * weight,
            fire: (self.fire ?? 0.0) + (sum.fire ?? 0.0) * weight,
            water: (self.water ?? 0.0) + (sum.water ?? 0.0) * weight,
        )
    }
    func rangedAnswer(slider: Float,
                      width: Float) -> AnswerWeights {
        return AnswerWeights.init(
            earth: self.earth != nil ? max(0, (1 - abs(slider - self.earth!) / width * 2)) : 0.0,
            air: self.air != nil ? max(0, (1 - abs(slider - self.air!) / width * 2)) : 0.0,
            fire: self.fire != nil ? max(0, (1 - abs(slider - self.fire!) / width * 2)) : 0.0,
            water: self.water != nil ? max(0, (1 - abs(slider - self.water!) / width * 2)) : 0.0
            )
    }
}

struct Answer {
    var text: String
    var alt: String?
    var score: AnswerWeights
}

var questions: [Question] = [
  Question(
    text: "What is your Sun Sign?",
    type: .single,
    weight: 1.7,
    width: nil,
    answers: [
        Answer(
            text: "Ares ♈︎  March 21–April 20",
            score: AnswerWeights(fire: 1.0)),
        Answer(
            text: "Taurus ♉︎ April 21–May 21",
            score: AnswerWeights(earth: 1.0)),
        Answer(
            text: "Gemini ♊︎ May 22–June 21",
            score: AnswerWeights(air: 1.0)),
        Answer(
            text: "Cancer ♋︎ June 22–July 23",
            score: AnswerWeights(water: 1.0)),
        Answer(
            text: "Leo ♌︎ July 24–August 23",
            score: AnswerWeights(fire: 1.0)),
        Answer(
            text: "Virgo ♍︎ Aug 24–Sept 23",
            score: AnswerWeights(earth: 1.0)),
        Answer(
            text: "Libra ♎︎ Sep 24–Oct 23",
            score: AnswerWeights(air: 1.0)),
        Answer(
            text: "Scorpio ♏︎ Oct 24–Nov 22",
            score: AnswerWeights(water: 1.0)),
        Answer(
            text: "Sagittarius ♐︎ Nov 23–Dec 21",
            score: AnswerWeights(fire: 1.0)),
        Answer(
            text: "Capricorn ♑︎ Dec 22–Jan 20",
            score: AnswerWeights(earth: 1.0)),
        Answer(
            text: "Aquarius ♒︎ Jan 21–Feb 19",
            score: AnswerWeights(air: 1.0)),
        Answer(
            text: "Pisces ♓︎ Feb 20–March 20",
            score: AnswerWeights(water: 1.0)),
    ]
  ),

  Question(
    text: "Pick your favorite color:",
    type: .single,
    weight: 3.1,
    width: nil,
    answers: [
      Answer(
        text: "Blue",
        score: AnswerWeights(water: 1.0)),
      Answer(
        text: "Black",
        score: AnswerWeights()),
      Answer(
        text: "Green",
        score: AnswerWeights(earth: 1.0)),
      Answer(
        text: "White",
        score: AnswerWeights(
            earth: 1.0, air: 1.0, fire: 1.0, water: 1.0)),
      Answer(
        text: "Yellow",
        score: AnswerWeights(air: 1.0)),
      Answer(
        text: "Red",
        score: AnswerWeights(fire: 1.0)),
    ]
  ),

  Question(
    text: "When you sit up in bed, which direction do you face?",
    type: .ranged,
    weight: 2.0,
    width: 1.0,
    answers: [
        Answer(text: "East", alt: "West", score: AnswerWeights(air: 0.0, water: 1.0)),
        Answer(text: "North", alt: "South", score: AnswerWeights(earth: 0.0, fire: 1.0)),
    ]
  ),

  Question(
    text: "Which seasons do you like?",
    type: .multiple,
    weight: 1.2,
    width: nil,
    answers: [
      Answer(
        text: "Summer",
        score: AnswerWeights(fire: 1.0)),
      Answer(
        text: "Spring",
        score: AnswerWeights(air: 1.0)),
      Answer(
        text: "Winter",
        score: AnswerWeights(earth: 1.0)),
      Answer(
        text: "Autumn",
        score: AnswerWeights(water: 1.0)),
    ]
  ),

  Question(
    text: "What times of the day do you like?",
    type: .multiple,
    weight: 1.0,
    width: nil,
    answers: [
      Answer(
        text: "Dawn",
        score: AnswerWeights(air: 1.0)),
      Answer(
        text: "Noon",
        score: AnswerWeights(fire: 1.0)),
      Answer(
        text: "Sunset",
        score: AnswerWeights(water: 1.0)),
      Answer(
        text: "Night",
        score: AnswerWeights(earth: 1.0)),
    ]
  ),

  Question(
    text: "Describe your energy:",
    type: .ranged,
    weight: 4.0,
    width: 0.5,
    answers: [
      Answer(
        text: "Feminine", alt: "Masculine",
        score: AnswerWeights(
            earth: 0.25,
            air: 0.75,
            fire: 1.0,
            water: 0.0,
        )),
    ]
  ),
]



// References:
// http://witchipedia.wikidot.com/table:western-elemental-correspondences
// https://en.wikipedia.org/wiki/Astrological_sign
