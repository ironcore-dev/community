import { existsSync, readdirSync } from 'node:fs'
import { join } from 'node:path'

export interface Meeting {
  date: string
  page: 'minutes' | 'agenda'
}

export default {
  load(): Meeting[] {
    const today = new Date().toISOString().slice(0, 10)
    return readdirSync(__dirname, { withFileTypes: true })
      .filter(d => d.isDirectory() && /^\d{4}-\d{2}-\d{2}$/.test(d.name) && d.name <= today)
      .map(d => ({
        date: d.name,
        page: existsSync(join(__dirname, d.name, 'minutes.md')) ? 'minutes' : 'agenda',
      }))
      .sort((a, b) => b.date.localeCompare(a.date))
  },
}
