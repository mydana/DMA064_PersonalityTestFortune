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
    var weight: Double
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

enum ElementType: Character {
    case earth = "🪨", air = "🌬️", fire = "🔥", water = "🌊"
}

struct AnswerWeights {
    var earth: Double? // Earth
    var air: Double? // Air
    var fire: Double? // Fire
    var water: Double? // Water
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
    weight: 1.0,
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
    weight: 1.0,
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
    answers: [
        Answer(text: "East", alt: "West", score: AnswerWeights(air: 0.0, water: 1.0)),
        Answer(text: "North", alt: "South", score: AnswerWeights(earth: 0.0, fire: 1.0)),
    ]
  ),

  Question(
    text: "Which seasons do you like?",
    type: .multiple,
    weight: 1.0,
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
    weight: 1.0,
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
