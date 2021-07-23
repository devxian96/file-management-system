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

              <!-- 게시글 입력 시작 -->
              <v-dialog v-model="openWrite" width="600px">
                <template #activator="{ on, attrs }">
                  <v-btn
                    depressed
                    filled
                    rounded
                    dense
                    class="write-input mt-2 mb-5"
                    v-bind="attrs"
                    width="95%"
                    v-on="on"
                    >새로운 이슈가 발생하셨나요?<v-spacer
                  /></v-btn>
                </template>
                <v-card>
                  <v-toolbar
                    color="success"
                    class="text-h5 font-weight-bold"
                    dark
                    dense
                    ><v-spacer />이슈 만들기<v-spacer /><v-btn
                      icon
                      dark
                      @click="openWrite = false"
                    >
                      <v-icon>fa-times-circle</v-icon>
                    </v-btn></v-toolbar
                  >
                  <v-card-text class="mt-5">
                    <v-overflow-btn
                      class="my-2"
                      :items="sort"
                      label="불량현황"
                      dense
                      hide-details
                    ></v-overflow-btn>

                    <h3>발생일자</h3>
                    <v-date-picker
                      v-model="picker"
                      landscape
                      full-width
                      header-color="success"
                      locale="ko-kr"
                    ></v-date-picker>

                    <v-text-field label="고객사" filled class="mt-5" />

                    <v-text-field label="관리번호" filled />

                    <v-text-field label="귀책부서" filled />

                    <v-text-field label="귀책구분" filled />

                    <v-text-field label="작업자" filled />

                    <v-overflow-btn
                      class="mb-6 mt-0"
                      :items="sort"
                      label="불량종류"
                      dense
                      hide-details
                    ></v-overflow-btn>

                    <v-text-field label="불량상세" filled />

                    <v-textarea filled label="불량요약" />

                    <v-textarea filled label="비고" />

                    <v-file-input
                      chips
                      counter
                      multiple
                      show-size
                      truncate-length="15"
                      label="이미지 파일 업로드"
                    ></v-file-input>
                  </v-card-text>
                  <v-card-actions>
                    <v-btn
                      color="success"
                      dark
                      width="100%"
                      class="font-weight-bold"
                      @click="openWrite = false"
                    >
                      등록
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-dialog>
              <!-- 게시글 입력 종료 -->

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
        <!-- 페이지 통계 -->
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
      openWrite: false,
      picker: new Date(Date.now() - new Date().getTimezoneOffset() * 60000)
        .toISOString()
        .substr(0, 10),
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
