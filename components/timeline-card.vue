<template>
  <v-card class="mb-5">
    <!-- 작성자 정보 시작 -->
    <v-card-title>
      <v-avatar size="32" color="success" class="mr-2">
        <v-icon>fa-user</v-icon>
      </v-avatar>
      작성자
      <v-chip class="ma-2" color="red" small label text-color="white">
        <v-icon left> fa-info </v-icon>
        미결
      </v-chip>
      <v-chip class="ma-2" color="red" small label text-color="white">
        <v-icon left> fa-exclamation-triangle </v-icon>
        불량율 1/1(100%)
      </v-chip>
    </v-card-title>
    <!-- 작성자 정보 종료 -->

    <!-- 작성 시점 정보 시작 -->
    <v-card-subtitle>
      {{ new Date().toLocaleString() }}
    </v-card-subtitle>
    <!-- 작성 시점 정보 종료 -->

    <!-- 정보 시작 -->
    <v-card-text>
      <v-list dense>
        <v-list-item color="accent">
          <v-list-item-title> 불량현황 </v-list-item-title>
          <v-list-item-subtitle>
            <v-chip class="ma-2" color="red" small label text-color="white">
              <v-icon left> fa-info </v-icon>
              미결 (치수불량)
            </v-chip>
          </v-list-item-subtitle>
        </v-list-item>
        <v-list-item>
          <v-list-item-title> 발생일자 </v-list-item-title>
          <v-list-item-subtitle>
            {{ new Date().toLocaleString() }}
          </v-list-item-subtitle>
        </v-list-item>
        <v-list-item color="accent">
          <v-list-item-title> 고객사 </v-list-item-title>
          <v-list-item-subtitle> 유한정밀 </v-list-item-subtitle>
        </v-list-item>
        <v-list-item>
          <v-list-item-title> 관리번호 </v-list-item-title>
          <v-list-item-subtitle> UK-07-30008 </v-list-item-subtitle>
        </v-list-item>
        <v-list-item color="accent">
          <v-list-item-title> 귀책부서 </v-list-item-title>
          <v-list-item-subtitle> 무진 </v-list-item-subtitle>
        </v-list-item>
        <v-list-item>
          <v-list-item-title> 귀책구분 </v-list-item-title>
          <v-list-item-subtitle> 무진 </v-list-item-subtitle>
        </v-list-item>
        <v-list-item color="accent">
          <v-list-item-title> 작업자 </v-list-item-title>
          <v-list-item-subtitle> 익명 </v-list-item-subtitle>
        </v-list-item>
      </v-list>

      <v-alert color="red" border="left" elevation="2" colored-border dense>
        <h5>치수 불량</h5>
        <pre>
        1. 7g6부 NG
        -ACT : 6.79
        2. 370±0.02 치수 NG
        -ACT : 369.71</pre
        >
      </v-alert>

      <p>비고 아무글</p>
    </v-card-text>
    <!-- 정보 종료 -->

    <!-- 이미지란 시작 -->
    <v-row dense class="mb-3 pr-2 pl-2">
      <facebook-style-img :imgs="imgs" />
    </v-row>
    <!-- 이미지란 종료 -->

    <v-divider inset class="m-auto" />

    <!-- 버튼 시작 -->
    <v-card-actions>
      <v-row dense>
        <v-col>
          <!-- 발생원인 및 개선대책 현황 작성 시작 -->
          <v-dialog v-model="openReason" width="600px">
            <template #activator="{ on, attrs }">
              <v-btn depressed text width="100%" v-bind="attrs" v-on="on"
                >발생원인 및 개선대책 현황 작성</v-btn
              >
            </template>
            <v-card>
              <v-toolbar
                color="success"
                class="text-h5 font-weight-bold"
                dark
                dense
                ><v-spacer />발생원인 및 개선대책 현황 작성<v-spacer /><v-btn
                  icon
                  dark
                  @click="openReason = false"
                >
                  <v-icon>fa-times-circle</v-icon>
                </v-btn></v-toolbar
              >
              <v-card-text class="mt-5">
                <h3><v-icon small class="mr-1">fa-wrench</v-icon>조치사항</h3>
                <v-textarea solo label="조치사항을 작성해 주세요"></v-textarea>
                <h3>
                  <v-icon small class="mr-1">fa-question-circle</v-icon>발생원인
                </h3>
                <v-textarea solo label="발생원인을 작성해 주세요"></v-textarea>
                <h3>
                  <v-icon small class="mr-1">fa-tasks</v-icon>재발방지대책
                </h3>
                <v-textarea
                  solo
                  label="재발방지대책을 작성해 주세요"
                ></v-textarea>
              </v-card-text>
              <v-card-actions>
                <v-btn
                  color="success"
                  dark
                  width="100%"
                  class="font-weight-bold"
                  @click="openReason = false"
                >
                  등록
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
          <!-- 발생원인 및 개선대책 현황 작성 종료 -->
        </v-col>
        <v-col>
          <!-- 수정기록 확인 시작 -->
          <v-dialog v-model="openLog" width="600px">
            <template #activator="{ on, attrs }">
              <v-btn depressed text width="100%" v-bind="attrs" v-on="on"
                >수정기록 확인</v-btn
              >
            </template>
            <v-card>
              <v-toolbar
                color="success"
                class="text-h5 font-weight-bold"
                dark
                dense
                ><v-spacer />수정기록 확인<v-spacer /><v-btn
                  icon
                  dark
                  @click="openLog = false"
                >
                  <v-icon>fa-times-circle</v-icon>
                </v-btn></v-toolbar
              >
              <v-card-text>
                <v-simple-table>
                  <template #default>
                    <thead>
                      <tr>
                        <th class="text-left">이름(계정)</th>
                        <th class="text-center">수정전</th>
                        <th class="text-center">수정후</th>
                        <th class="text-right">수정일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="item in editLog" :key="item.name">
                        <td class="text-left">
                          {{ item.name }}({{ item.id }})
                        </td>
                        <td class="text-center">{{ item.before }}</td>
                        <td class="text-center">{{ item.after }}</td>
                        <td class="text-right">{{ item.updatedAt }}</td>
                      </tr>
                    </tbody>
                  </template>
                </v-simple-table>
              </v-card-text>
            </v-card>
          </v-dialog>
          <!-- 수정기록 확인 종료 -->
        </v-col>
        <v-col>
          <!-- 공유 기능 시작 -->
          <v-btn depressed text width="100%" @click="copyClipBoard()"
            >공유</v-btn
          >
          <v-snackbar v-model="snackbar" shaped>
            <v-icon color="success" class="mr-2">fa-check-circle</v-icon>링크를
            클립보드에 복사했습니다.
            <template #action="{ attrs }">
              <v-btn color="red" text v-bind="attrs" @click="snackbar = false">
                닫기
              </v-btn>
            </template>
          </v-snackbar>
          <!-- 공유 기능 종료 -->
        </v-col>
      </v-row>
    </v-card-actions>
    <!-- 버튼 종료 -->

    <v-card-text>
      <h3><v-icon small class="mr-1">fa-wrench</v-icon>조치사항</h3>
      <p>뭔가의 조치사항</p>
      <h3><v-icon small class="mr-1">fa-question-circle</v-icon>발생원인</h3>
      <p>뭔가의 발생원인</p>
      <h3><v-icon small class="mr-1">fa-tasks</v-icon>재발방지대책</h3>
      <p>뭔가의 재발방지 대책</p>
    </v-card-text>
  </v-card>
</template>

<script>
import facebookStyleImg from '@/components/widget/facebook-style-img.vue'
export default {
  components: { facebookStyleImg },
  data() {
    return {
      snackbar: false,
      openLog: false,
      openReason: false,
      imgs: ['/img/1.jpeg', '/img/2.jpeg', '/img/2.jpeg', '/img/2.jpeg'],
      editLog: [
        {
          name: '홍길동',
          id: 'coolman555',
          before: '안녕',
          after: '안녕하세요',
          updatedAt: new Date().toLocaleString(),
        },
        {
          name: '홍길동',
          id: 'coolman555',
          before: '안녕',
          after: '안녕하세요',
          updatedAt: new Date().toLocaleString(),
        },
        {
          name: '홍길동',
          id: 'coolman555',
          before: '안녕',
          after: '안녕하세요',
          updatedAt: new Date().toLocaleString(),
        },
        {
          name: '홍길동',
          id: 'coolman555',
          before: '안녕',
          after: '안녕하세요',
          updatedAt: new Date().toLocaleString(),
        },
        {
          name: '홍길동',
          id: 'coolman555',
          before: '안녕',
          after: '안녕하세요',
          updatedAt: new Date().toLocaleString(),
        },
      ],
    }
  },
  methods: {
    copyClipBoard() {
      this.snackbar = true
      navigator.clipboard.writeText(this.$route.path)
    },
  },
}
</script>

<style scoped>
.m-auto {
  margin: auto !important;
}
</style>
