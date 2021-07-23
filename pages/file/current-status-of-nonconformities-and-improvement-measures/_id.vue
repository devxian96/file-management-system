<template>
  <div>
    <v-subheader>부적합 발생 및 개선대책 현황 [{{ title }}]</v-subheader>

    <v-row dense>
      <v-col cols="8">
        <v-sheet class="mb-8 mt-3" elevation="2">
          <v-row>
            <!-- 글쓰기 버튼 -->
            <v-col cols="12" class="pr-7 pl-7 pb-0">
              <v-avatar size="32" color="success" class="mr-2 mt-2 float-left">
                <v-icon>fa-user</v-icon>
              </v-avatar>
              <v-text-field
                label="새로운 이슈가 발생하셨나요?"
                disabled
                filled
                rounded
                dense
                class="write-input"
              ></v-text-field>

              <v-divider />
            </v-col>

            <!-- 정렬 -->
            <v-col cols="12" class="pr-7 pl-7">
              <v-row dense>
                <v-col cols="4">
                  <v-overflow-btn
                    class="my-2"
                    :items="defectStatus"
                    label="불량현황"
                    dense
                    rounded
                    hide-details
                  ></v-overflow-btn>
                </v-col>
                <v-col cols="4">
                  <v-overflow-btn
                    class="my-2"
                    :items="defectType"
                    label="불량종류"
                    dense
                    rounded
                    hide-details
                  ></v-overflow-btn>
                </v-col>
                <v-col cols="4">
                  <v-overflow-btn
                    class="my-2"
                    :items="sort"
                    label="정렬순"
                    dense
                    rounded
                    hide-details
                  ></v-overflow-btn>
                </v-col>
              </v-row>
            </v-col>
          </v-row>
        </v-sheet>

        <!-- 타임 라인 -->
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
      defectStatus: ['기본', '미결', '완료'],
      defectType: ['기본', '치수불량', '외관불량'],
      sort: ['기본', '오래된 순'],
    }
  },
}
</script>

<style scoped>
.write-input {
  height: 62px;
}
</style>
