require "nokogiri"
require "json"

years = Dir.glob("source/*.html").grep(/source\/\d{4}.html/).collect{|file| file[/\d{4}/]}.sort

years.each{|year|
  @doc = Nokogiri::HTML(File.open("source/#{year}.html"))
  invoices = @doc.css("div#primary table tbody tr").collect{|row|
    {
      agend_cislo: row.css("td.column-1").text,
      cislo_fakt_dodavatele: row.css("td.column-2").text,
      nazev_dodavatele: row.css("td.column-3").text,
      ico: row.css("td.column-4").text,
      popis: row.css("td.column-5").text,
      dat_evid: row.css("td.column-6").text,
      dat_spl: row.css("td.column-7").text,
      dat_uhr: row.css("td.column-8").text,
      celk_castka: row.css("td.column-9").text
    }
  }
  File.open("data/#{year}.json","w"){|f| f<<JSON.pretty_generate(invoices)}
}
