<script setup>
import { data as meetings } from './meetings.data'
import { withBase } from 'vitepress'

const repo = 'https://github.com/ironcore-dev/community/blob/main/docs/steering/meetings'
</script>

# Steering Committee Meetings

## Past Meetings

<ul>
  <li v-for="m in meetings" :key="m.date">
    <a :href="withBase(`/steering/meetings/${m.date}/${m.page}`)">{{ m.date }}</a>
  </li>
</ul>

## Resources

<ul>
  <li><a :href="`${repo}/agenda-template.md`">Agenda template</a></li>
  <li><a :href="`${repo}/minutes-template.md`">Minutes template</a></li>
</ul>
