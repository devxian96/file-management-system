<template>
  <div>
  <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
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

      :single-select="singleSelect"
      item-key="name"
      show-select
      class="elevation-1"
  >
      <!-- https://vuetifyjs.com/en/components/data-tables/#crud-actions
      이 사이트의 Row selection 의 코드를 <v-data-table> 태그 안에 넣었으며,
      아래 세 줄의 코드를 제거하니 작동됨.
      v-model="selected"
      :headers="headers"
      :items="desserts" 
      -->
    <template v-slot:top>
      <v-switch
        v-model="singleSelect"
        label="Single select"
        class="pa-3"
      ></v-switch>
    </template>
    ></v-data-table>
  </v-card>
  <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
  </div>
</template>
    
    

<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->



<script>
  export default {
    data () {
      return {
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
          { text: '이름', value: 'calories' },
          { text: '비밀 번호', value: 'password' },
          { text: '전화 번호', value: 'phoneNumber' },
          { text: '직책', value: 'position' },
          { text: '부서', value: 'division' },
          { text: '권한', value: 'level' },
          { text: 'IP', value: 'ip' },
          { text: '접속 기록', value: 'log' },
          { text: '제어', value: 'contron' }
        ],
        // 이름,아이디,비밀번호,전화번호/직책,부서,권한/IP,접속기록(리스트)
        desserts: [
          {
            ID: 'Frozen Yogurt',
            calories: 159,
            password: 6.0,
            phoneNumber: 24,
            position: 4.0,
            division: '1%',
            a: 1
          },
          {
            ID: 'Ice cream sandwich',
            calories: 237,
            password: 9.0,
            phoneNumber: 37,
            position: 4.3,
            division: '1%',
          },
          {
            ID: 'Eclair',
            calories: 262,
            password: 16.0,
            phoneNumber: 23,
            position: 6.0,
            division: '7%',
          },
          {
            ID: 'Cupcake',
            calories: 305,
            password: 3.7,
            phoneNumber: 67,
            position: 4.3,
            division: '8%',
          },
          {
            ID: 'Gingerbread',
            calories: 356,
            password: 16.0,
            phoneNumber: 49,
            position: 3.9,
            division: '16%',
          },
          {
            ID: 'Jelly bean',
            calories: 375,
            password: 0.0,
            phoneNumber: 94,
            position: 0.0,
            division: '0%',
          },
          {
            ID: 'Lollipop',
            calories: 392,
            password: 0.2,
            phoneNumber: 98,
            position: 0,
            division: '2%',
          },
          {
            ID: 'Honeycomb',
            calories: 408,
            password: 3.2,
            phoneNumber: 87,
            position: 6.5,
            division: '45%',
          },
          {
            ID: 'Donut',
            calories: 452,
            password: 25.0,
            phoneNumber: 51,
            position: 4.9,
            division: '22%',
          },
          {
            ID: 'KitKat',
            calories: 518,
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
