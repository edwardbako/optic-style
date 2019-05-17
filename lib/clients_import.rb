class ClientsImport

  def initialize

  end

  def process
    branch = Branch.first
    files.each do |f|
      data = parse_file(f)
      client = Client.create(data.except(:phones, :recipes, :orders).merge(branch: branch))
      client.phones.create(data[:phones])
      client.recipes.create(data[:recipes])
      client.orders.create(data[:orders])
    end
  end

  def parse_file(file)
    sheet = Roo::Spreadsheet.open(file).sheet(0)
    {
        last_name: fio(sheet)[0],
        first_name: fio(sheet)[1],
        patronymic: (fio(sheet)[2..-1].join(' ') if fio(sheet)[2..-1].present? ),
        phones: phones(sheet),
        recipes: recipes(sheet),
        orders: orders(sheet)
    }
  end

  def fio(sheet)
    sheet.column(1)[1..-1].join(' ').split(' ')
  end

  def phones(sheet)
    col = sheet.column(3)[1..-1].compact
    result = []

    col.each do |e|
      if e.to_s.count('a-zA-Zа-яА-Я') == 0
        str = e.to_s.gsub('.0', '').tr('^0-9', '')
        number = case str.size
        when 7
          "+7 (383) #{str[0..2]}-#{str[3..4]}-#{str[5..6]}"
        when 10
          "+7 (#{str[0..2]}) #{str[3..5]}-#{str[6..7]}-#{str[8..9]}"
        when 11
          "+7 (#{str[1..3]}) #{str[4..6]}-#{str[7..8]}-#{str[9..10]}"
        else
          "NONE #{str}"
                   end
        result << {number: number}
      else
        if result.size > 0
          result.last[:comment] = e
        else
          result << {number: "", comment: e}
        end
      end
    end
    result.present? ? result : [{number: ""}]
  end

  def recipes(sheet)
    col = sheet.column(6)[1..-1]
    dates = sheet.column(4)[1..-1]
    result = []
    i = 0
    date = nil

    col.each do |e|
      if e.is_a?(String)
        case e.first
        when 'R'
          if dates[i].present?
            date = dates[i]
          end
          e =~ /(R)?([^a-zA-Z]*)(cyl)?([^a-zA-Z]*)(ax)?([^a-zA-Z]*)(add)?([^a-zA-Z]*)/i
          result << {date: date,
                     od_sph: ($2.strip if $1.present?),
                     od_cyl: ($4.strip if $3.present?),
                     od_ax: ($6.strip if $5.present?),
                     od_add: ($8.strip if $7.present?)
          }
        when 'L'
          e =~ /(L)?([^a-zA-Z]*)(cyl)?([^a-zA-Z]*)(ax)?([^a-zA-Z]*)(add)?([^a-zA-Z]*)/i
          result.last['os_sph'] = ($2.strip if $1.present?)
          result.last['os_cyl'] = ($4.strip if $3.present?)
          result.last['os_ax'] = ($6.strip if $5.present?)
          result.last['os_add'] = ($8.strip if $7.present?)
        when 'P'
          e =~ /(pd)?([^a-zA-Z]*)/i
          result.last['dp'] = $2.strip
        else
          result.last['comment'] = e
        end
      end
      i += 1
    end
    result
  end

  def orders(sheet)
    numbers = sheet.column(2)[1..-1]
    dates = sheet.column(4)[1..-1]
    frames = sheet.column(7)[1..-1]
    lenses = sheet.column(8)[1..-1]
    totals = sheet.column(9)[1..-1]
    comments = sheet.column(10)[1..-1]

    ranges = []
    s = 0
    e = 0

    numbers.each_with_index do |n, i|
      if n.present?
        if e > 0
          ranges << (s..e)
        end
        s = i
      else
        e = i
      end
    end
    ranges << (s..-1)

    result = []
    date = nil

    ranges.each do |r|
      if dates[r].first.present?
        date = dates[r].first
      end
      result << {
          number: numbers[r].first.to_s.gsub("№", "").strip,
          date: date,
          frame: frames[r].reject(&:blank?).join(', ').strip,
          lenses: lenses[r].reject(&:blank?).join(', ').strip,
          sum: totals[r].reject(&:blank?).join(', ').strip,
          comment: comments[r].reject(&:blank?).join(', ').strip
      }
    end
    result
  end

  def files
    Dir[File.join(Rails.root, 'data/clients/**')]
  end

end