<template>
  <div>
    <v-subheader>부적합 발생 및 개선대책 현황 [{{ title }}]</v-subheader>

    <v-row dense>
      <v-col cols="8">
        <timeline-card v-for="item in [1, 2]" :key="item" />
      </v-col>
      <v-col cols="4">
        <timeline-calc />
      </v-col>
    </v-row>
  </div>
</template>

<script>
import timelineCard from '@/components/timeline-card.vue'
import timelineCalc from '@/components/timeline-calc.vue'
export default {
  components: { timelineCard, timelineCalc },
  validate({ params }) {
    return /^\d+$/.test(params.id)
  },
  asyncData({ params }) {
    return { id: params.id }
  },
  data() {
    return {
      title: '2021년 7월 1주차 2021년 7월 1주차',
      benched: 10,
    }
  },
}
</script>
