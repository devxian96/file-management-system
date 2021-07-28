<template>
  <div>
    <!-- 회원 정보 수정 시작 -->
    <!-- 오른쪽 위 동그란 버튼 눌러야 수정 후 저장 가능 -->
    <v-card
      class="overflow-hidden"
      color="purple lighten-1"
      dark
    >
      <v-toolbar
        flat
        color="purple"
      >
        <v-icon>mdi-account</v-icon>
        <v-toolbar-title class="font-weight-light">
          User Profile
        </v-toolbar-title>
        <v-spacer></v-spacer>
        <v-btn
          color="purple darken-3"
          fab
          small
          @click="isEditing = !isEditing"
        >
          <v-icon v-if="isEditing">
            mdi-close
          </v-icon>
          <v-icon v-else>
            mdi-pencil
          </v-icon>
        </v-btn>
      </v-toolbar>
      <v-card-text>
      <v-row>
        <v-col cols="12" sm="6">
          <v-text-field
            :disabled="!isEditing"
            color="white"
            label="ID"
          ></v-text-field>
          </v-col>
        <v-col cols="12" sm="6">
          <v-text-field label="비밀번호" filled />
        </v-col>

        <v-col cols="12" sm="6">
          <v-text-field label="이름" filled />
        </v-col>

        <v-col cols="12" sm="6">
          <v-text-field label="전화번호" filled />
        </v-col>

        <v-col cols="12" sm="6">
          <v-text-field label="부서" filled />
        </v-col>

        <v-col cols="12" sm="6">
          <v-text-field label="직책" filled />
        </v-col>

        <v-col cols="12" sm="6">
          <v-text-field label="IP" filled />
        </v-col>

        <v-col cols="12" sm="6">
          <v-autocomplete
            :disabled="!isEditing"
            :items="states"
            :filter="customFilter"
            color="white"
            item-text="name"
            label="권한"
          ></v-autocomplete>
          </v-col>

        <v-col>
          <v-text-field label="설명" filled />
        </v-col>
        </v-row>
      </v-card-text>
      <v-divider></v-divider>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn
          :disabled="!isEditing"
          color="success"
          @click="save"
        >
          Save
        </v-btn>
      </v-card-actions>
      <v-snackbar
        v-model="hasSaved"
        :timeout="2000"
        absolute
        bottom
        left
      >
        Your profile has been updated
      </v-snackbar>
    </v-card>
    <!-- 회원 정보 수정 종료 -->

    <!-- 접속 기록 시작 -->
    <v-data-table
      dense
      :headers="headers"
      :items="messages"
      item-key="from"
      class="elevation-1"
    ></v-data-table>
    <!-- 접속 기록 종료 -->

    <div>
      <v-divider class="mt-5 mb-5" />

      <v-row>
        <!-- 로그인 이력 시작 -->
        <v-col cols="4">
          <v-card>
            <v-img height="200px" src="https://picsum.photos/200/300">
              <v-app-bar flat color="transparent"></v-app-bar>

              <v-card-title class="white--text mt-8">
                <v-avatar color="success">
                  <v-icon dark> fa-user </v-icon>
                </v-avatar>
                <p class="ml-3 mt-3">{{ name }}님 환영합니다</p>
              </v-card-title>
            </v-img>

            <v-card-text>
              <div class="font-weight-bold ml-8 mb-2">금일 로그인 이력</div>

              <v-timeline align-top dense>
                <v-timeline-item
                  v-for="message in messages"
                  :key="message.time"
                  :color="message.color"
                  small
                >
                  <div>
                    <div class="font-weight-normal">
                      <strong>{{ message.from }}</strong> @{{ message.time }}
                    </div>
                    <div>{{ message.message }}</div>
                  </div>
                </v-timeline-item>
              </v-timeline>
            </v-card-text>
          </v-card>
        </v-col>
        <!-- 로그인 이력 종료 -->

        <v-col>
          <!-- 최근 수정한 문서 시작 -->
          <v-card class="mb-5">
            <v-card-title>최근 수정한 문서</v-card-title>
            <v-card-text>
              <v-list>
                <v-list-item nuxt link dense>
                  <v-list-item-title>문서이름</v-list-item-title>
                  <v-list-item-subtitle>{{
                    new Date().toLocaleString()
                  }}</v-list-item-subtitle>
                </v-list-item>
              </v-list>
            </v-card-text>
          </v-card>
          <!-- 최근 수정한 문서 종료 -->

          <!-- 최근 확인한 문서 시작 -->
          <v-card>
            <v-card-title>최근 확인한 문서</v-card-title>
            <v-card-text>
              <v-list>
                <v-list-item nuxt link dense>
                  <v-list-item-title>문서이름</v-list-item-title>
                  <v-list-item-subtitle>{{
                    new Date().toLocaleString()
                  }}</v-list-item-subtitle>
                </v-list-item>
              </v-list>
            </v-card-text>
          </v-card>
          <!-- 최근 확인한 문서 종료 -->
        </v-col>
      </v-row>
    </div>
</div>
</template>

<script>
  export default {
    data () {
      return {
        hasSaved: false,
        isEditing: null,
        model: null,
        states: [
          { name: 'Florida', abbr: 'FL', id: 1 },
          { name: 'Georgia', abbr: 'GA', id: 2 },
          { name: 'Nebraska', abbr: 'NE', id: 3 },
          { name: 'California', abbr: 'CA', id: 4 },
          { name: 'New York', abbr: 'NY', id: 5 },
        ],
        name: '관리자',
        headers: [
          {
            align: 'start',
            sortable: false,
          },
          { text: '접속 기록', value: 'time' },
          { text: 'IP', value: 'protocol' },
          { text: 'undefined', value: 'from' },
          { text: '결과', value: 'result' },
          { text: '수정한 문서', value: 'revise' },
          { text: '접속 경로', value: 'referrer' },
          { text: '브라우저', value: 'browser' },
          { text: '운영체제', value: 'os' },
          { text: '접속기기', value: 'device' },  
        ],
        messages: [
          {
          from: '로그인',
          time: new Date().toLocaleString(),
          protocol: 'localhost:3000',
          result: '로그인 성공',
          referrer: 'https://www.youtube.com/',
          browser: 'Chrome',
          os: 'windows',
          device: 'mobile',
          },
          {
            protocol: 'localhost:3000',
            from: '로그인',
            time: new Date().toLocaleString(),
            result: '로그인 성공',
            revise: 'document/file',
            referrer: 'google.com',
          },
          {
            from: '로그인',
            time: new Date().toLocaleString(),
            result: '로그인 성공',
          },
          {
            from: '로그인',
            time: new Date().toLocaleString(),
            result: '로그인 성공',
          },
          {
            from: '로그인',
            time: new Date().toLocaleString(),
            result: '로그인 성공',
          },
          {
            from: '로그인',
            time: new Date().toLocaleString(),
            result: '로그인 실패 (192.168.0.1)',
          },
        ],
      }
    },

    methods: {
      customFilter (item, queryText, itemText) {
        const textOne = item.name.toLowerCase()
        const textTwo = item.abbr.toLowerCase()
        const searchText = queryText.toLowerCase()

        return textOne.includes(searchText) > -1 ||
          textTwo.includes(searchText) > -1
      },
      save () {
        this.isEditing = !this.isEditing
        this.hasSaved = true
      },
    },
  }
</script>