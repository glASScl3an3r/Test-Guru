class TableSorter {
  static setSortAbilityTo(tableId) {
    const table = document.getElementById(tableId)
    if (!table) return

    const sortByColumn = table.querySelector('.sort-by')
    if (sortByColumn) {
      sortByColumn.addEventListener('click', () => {
        //каждый раз ищем таблицу заново, иначе не работает
        const table = document.getElementById(tableId)
        new TableSorter(table).sortTable()
      })
    }
  }

  constructor(table) {
    this.table = table
  }

  sortTable() {
    const rows = this.table.querySelectorAll('tr')
    const rowsSorted = []
    for(let i = 1; i < rows.length; i++) {
      rowsSorted.push(rows[i])
    }

    const columnToSortIndex = document.querySelector('.sort-by').cellIndex
    if (this.table.querySelector('.octicon-arrow-up').classList.contains('hide')) {
      rowsSorted.sort(this.compareRowsAsc(columnToSortIndex))
      this.table.querySelector('.octicon-arrow-up').classList.remove('hide')
      this.table.querySelector('.octicon-arrow-down').classList.add('hide')
    }
    else {
      rowsSorted.sort(this.compareRowsDesc(columnToSortIndex))
      this.table.querySelector('.octicon-arrow-down').classList.remove('hide')
      this.table.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    const tableSorted = document.createElement('table')
    tableSorted.classList.add('table')
    tableSorted.id = this.table.id

    tableSorted.appendChild(rows[0])
    for (let i = 0; i < rowsSorted.length; i++) {
      tableSorted.appendChild(rowsSorted[i])
    }

    this.table.parentNode.replaceChild(tableSorted, this.table)
  }

  compareRowsAsc(columnToSortIndex) {
    return function(row1, row2) {
      const testTitle1 = row1.getElementsByTagName("td")[columnToSortIndex].textContent
      const testTitle2 = row2.getElementsByTagName("td")[columnToSortIndex].textContent

      if (testTitle1 < testTitle2) {return -1}
      if (testTitle1 > testTitle2) {return 1}
      return 0
    }
  }

  compareRowsDesc(columnToSortIndex) {
    return function(row1, row2) {
      const testTitle1 = row1.getElementsByTagName("td")[columnToSortIndex].textContent
      const testTitle2 = row2.getElementsByTagName("td")[columnToSortIndex].textContent

      if (testTitle1 > testTitle2) {return -1}
      if (testTitle1 < testTitle2) {return 1}
      return 0
    }
  }
}

export default TableSorter
