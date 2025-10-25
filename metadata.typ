#let format_strane = "iso-b5"         // могуће вредности: iso-b5, a4
#let naslov = "Наслов дипломског рада"
#let autor = "Уписати име и презиме"

// На енглеском
#let naslov_eng = "Thesis Title in English"
#let autor_eng = "Upisati ime i prezime na latinici"

#let indeks = "Уписати индекс"

// Име и презиме ментора
#let mentor = "Бранко Милосављевић"
// Звање: редовни професор, ванредни професор, доцент
#let mentor_zvanje = "редовни професор"

// Скинути коментаре са одговарајућих линија
#let studijski_program = "Софтверско инжењерство и информационе технологије"
#let stepen = "Основне академске студије"
//#let stepen = "Мастер академске студије"

#let godina = [#datetime.today().year()]

// FIXME: Аутоматизовати бројање цитата и прилога
// За сада унети ручно број референци/цитата из поглавља Литература.
#let broj_citata = 4
// Такође унети ручно и број прилога.
#let broj_priloga = 2

#let kljucne_reci = "Кључне речи везане за тему дипломског рада"
#let apstrakt = [
     Овде навести кратак апстракт дипломског рада у пар реченица.
]

// На енглеском
#let kljucne_reci_eng = "Template, thesis, tutorial"
#let apstrakt_eng = [
     Please provide a short abstract of the thesis in a couple of sentences.
]

// TODO: Текст задатка добијате од ментора. Заменити доле #lorem(100) са текстом задатка.
#let zadatak = [
     #lorem(100)
]

// TODO: Датум одбране и чланове комисије добијате од ментора
#let datum_odbrane = "01.01.2025"
#let komisija_predsednik = "Горан Сладић"
#let komisija_predsednik_zvanje = "редовни професор"
#let komisija_clan = "Мирослав Зарић"
#let komisija_clan_zvanje = "редовни професор"

// На енглеском уписати чланове на латиници
#let komisija_predsednik_eng = "Goran Sladić"
#let komisija_clan_eng = "Miroslav Zarić"
#let mentor_eng = "Branko Milosavljević"


// Ово даље углавном не треба мењати.

#let zvanje_eng = (
     "редовни професор": "full professor",
     "ванредни професор": "assoc. professor",
     "доцент": "asist. professor",
)
#let komisija_predsednik_zvanje_eng = zvanje_eng.at(komisija_predsednik_zvanje)
#let komisija_clan_zvanje_eng = zvanje_eng.at(komisija_clan_zvanje)
#let mentor_zvanje_eng = zvanje_eng.at(mentor_zvanje)


#let vrsta_rada = if stepen == "Мастер академске студије" {
    "Дипломски - мастер рад"
} else {
    "Дипломски - бечелор рад"
}

#let oblast = "Електротехничко и рачунарско инжењерство"
#let oblast_eng = "Electrical and Computer Engineering"
#let disciplina = "Примењене рачунарске науке и информатика"
#let disciplina_eng = "Applied computer science and informatics"

#import "funkcije.typ": *
// Поглавља/страна/цитата/табела/слика/графика/прилога
#let fizicki_opis = physical(broj_citata, broj_priloga)
