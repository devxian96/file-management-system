<template>
  <div>
  <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
  <!-- https://vuetifyjs.com/en/components/data-tables/#crud-actions 에서 Search 코드 복사 [[시작]] -->
    <v-card>
      <v-card-title>
        관리자 설정
        <v-spacer></v-spacer>
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="Search"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-data-table
      :headers="headers"
      :items="desserts"
      :search="search"
      v-model="selected"
    :single-select="singleSelect"
    item-key="name"
    show-select
    class="elevation-1"
      >
        <!-- https://vuetifyjs.com/en/components/data-tables/#crud-actions
        이 사이트의 Row selection 의 코드를 <v-data-table> 태그 안에 넣고,  
        :headers="headers"
        :items="desserts"  코드를 삭제 -->
        <template v-slot:top>
          <v-switch
            v-model="singleSelect"
            label="Single select"
            class="pa-3"
          ></v-switch>
          <!-- '회원추가 dialog' 추가 [[시작]] -->
          <v-row justify="center">
            <v-dialog
              v-model="dialog"
              persistent
              max-width="600px"
            >
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="primary"
                  dark
                  v-bind="attrs"
                  v-on="on"
                >
                  회원 추가
                </v-btn>
              </template>
              <v-card>
                <v-card-title>
                  <span class="text-h5">User Profile</span>
                </v-card-title>
                <v-card-text>
                  <v-container>
                    <v-row>
                      <v-col
                        cols="12"
                        sm="6"
                        md="4"
                      >
                        <v-text-field
                          label="Legal first name*"
                          required
                        ></v-text-field>
                      </v-col>
                      <v-col
                        cols="12"
                        sm="6"
                        md="4"
                      >
                        <v-text-field
                          label="Legal middle name"
                          hint="example of helper text only on focus"
                        ></v-text-field>
                      </v-col>
                      <v-col
                        cols="12"
                        sm="6"
                        md="4"
                      >
                        <v-text-field
                          label="Legal last name*"
                          hint="example of persistent helper text"
                          persistent-hint
                          required
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12">
                        <v-text-field
                          label="Email*"
                          required
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12">
                        <v-text-field
                          label="Password*"
                          type="password"
                          required
                        ></v-text-field>
                      </v-col>
                      <v-col
                        cols="12"
                        sm="6"
                      >
                        <v-select
                          :items="['0-17', '18-29', '30-54', '54+']"
                          label="Age*"
                          required
                        ></v-select>
                      </v-col>
                      <v-col
                        cols="12"
                        sm="6"
                      >
                        <v-autocomplete
                          :items="['Skiing', 'Ice hockey', 'Soccer', 'Basketball', 'Hockey', 'Reading', 'Writing', 'Coding', 'Basejump']"
                          label="Interests"
                          multiple
                        ></v-autocomplete>
                      </v-col>
                    </v-row>
                  </v-container>
                  <small>*indicates required field</small>
                </v-card-text>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn
                    color="blue darken-1"
                    text
                    @click="dialog = false"
                  >
                    Close
                  </v-btn>
                  <v-btn
                    color="blue darken-1"
                    text
                    @click="dialog = false"
                  >
                    Save
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
          </v-row>
          <!-- '회원추가 dialog' 추가 [[종료]] -->
        </template>
      </v-data-table>
    </v-card>
  <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
  </div>
</template>



<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->



<script>
  export default {
    data () {
      return {
        dialog: false,
        singleSelect: false,
        search: '',
        selected: [],
        headers: [
          {
            text: 'ID',
            align: 'start',
            sortable: false,
            value: 'ID',
          },
          { text: '이름', value: 'name' },
          { text: '비밀 번호', value: 'password' },
          { text: '전화 번호', value: 'phoneNumber' },
          { text: '직책', value: 'position' },
          { text: '부서', value: 'division' },
          { text: '권한', value: 'level' },
          { text: 'IP', value: 'protocol' },
          { text: '접속 기록', value: 'log' },
          { text: '관리', value: 'admin' }
        ],
        // ID,이름,비밀번호,전화번호/직책,부서,권한/IP,접속기록(리스트), 관리
        desserts: [
          {
            ID: 'Son of Heaven',
            name: '장씨',
            password: 1234,
            phoneNumber: '010-0000-0000',
            position: '사장',
            division: '영업부',
            level: 'admin',
            protocol: 'lacalhost:3000',
            log: '어제' ,
            admin: '삭제'
          },
          {
            ID: 'Ice cream sandwich',
            name: 237,
            password: 9.0,
            phoneNumber: 37,
            position: 4.3,
            division: '1%',
          },
          {
            ID: 'Eclair',
            name: 262,
            password: 16.0,
            phoneNumber: 23,
            position: 6.0,
            division: '7%',
          },
          {
            ID: 'Cupcake',
            name: 305,
            password: 3.7,
            phoneNumber: 67,
            position: 4.3,
            division: '8%',
          },
          {
            ID: 'Gingerbread',
            name: 356,
            password: 16.0,
            phoneNumber: 49,
            position: 3.9,
            division: '16%',
          },
          {
            ID: 'Jelly bean',
            name: 375,
            password: 0.0,
            phoneNumber: 94,
            position: 0.0,
            division: '0%',
          },
          {
            ID: 'Lollipop',
            name: 392,
            password: 0.2,
            phoneNumber: 98,
            position: 0,
            division: '2%',
          },
          {
            ID: 'Honeycomb',
            name: 408,
            password: 3.2,
            phoneNumber: 87,
            position: 6.5,
            division: '45%',
          },
          {
            ID: 'Donut',
            name: 452,
            password: 25.0,
            phoneNumber: 51,
            position: 4.9,
            division: '22%',
          },
          {
            ID: 'KitKat',
            name: 518,
            password: 26.0,
            phoneNumber: 65,
            position: 7,
            division: '6%',
          },
        ],
      }
    },
  }
</script>
