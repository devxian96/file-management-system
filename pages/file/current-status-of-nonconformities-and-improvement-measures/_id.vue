<template>
  <div>
    <v-subheader>부적합 발생 및 개선대책 현황 [{{ title }}]</v-subheader>
    <!-- 

        페이스북 타임라인처럼 만들면 된다.
        발생원인및 개선대책 현황만 수정가능하게 하면 된다.
        출하 검사 이력카드 기능은 제거한다.
        오직 부적합 발생 및 개선대책 현황만 보여주면 된다.

        이용자의 나이는 많다.

        쉽게 문서를 보고 확인할 수 있도록 해야한다.

        문제파악이 주요 쟁점.

        -->
    <v-card>
      <v-card-title>
        {{ title }}

        <v-spacer></v-spacer>

        <v-text-field
          v-model="search"
          clearable
          prepend-icon="fa-search"
          label="찾기"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-data-table
        :headers="headers"
        :items="desserts"
        class="elevation-1"
        :search="search"
        item-key="id"
        show-select
      >
        <template #[`item.calories`]="{ item }">
          <v-chip :color="getColor(item.calories)">
            {{ item.calories }}
          </v-chip>
        </template>
        <template #[`item.name`]="props">
          <v-edit-dialog
            :return-value.sync="props.item.name"
            large
            persistent
            @save="save"
            @cancel="cancel"
            @open="open"
          >
            <div>{{ props.item.name }}</div>
            <template #input>
              <div class="mt-4 text-h6">Update name</div>
              <v-text-field
                v-model="props.item.name"
                label="Edit"
                single-line
                counter
                autofocus
              ></v-text-field>
            </template>
          </v-edit-dialog>
        </template>
        <template #[`item.iron`]="props">
          <v-edit-dialog
            :return-value.sync="props.item.iron"
            large
            persistent
            @save="save"
            @cancel="cancel"
            @open="open"
          >
            <div>{{ props.item.iron }}</div>
            <template #input>
              <div class="mt-4 text-h6">Update Iron</div>
              <v-text-field
                v-model="props.item.iron"
                label="Edit"
                single-line
                counter
                autofocus
              ></v-text-field>
            </template>
          </v-edit-dialog>
        </template>
      </v-data-table>
    </v-card>

    <!-- Excel 다운로드 시작 -->
    <v-row class="mt-2">
      <v-col cols="12" class="text-right">
        <v-btn color="success" dark outlined
          ><v-icon class="mr-2">fa-file-excel</v-icon> 다운로드</v-btn
        >
      </v-col>
    </v-row>
    <!-- Excel 다운로드 종료 -->

    <!-- 스낵바 메세지창 시작 -->
    <v-snackbar v-model="snack" :timeout="3000" :color="snackColor">
      {{ snackText }}

      <template #action="{ attrs }">
        <v-btn v-bind="attrs" text @click="snack = false"> Close </v-btn>
      </template>
    </v-snackbar>
    <!-- 스낵바 메세지창 종료 -->
  </div>
</template>

<script>
export default {
  validate({ params }) {
    return /^\d+$/.test(params.id)
  },
  asyncData({ params }) {
    return { id: params.id }
  },
  data() {
    return {
      title: '2021년 7월 1주차 2021년 7월 1주차',
      snack: false,
      snackColor: '',
      snackText: '',
      search: '',
      headers: [
        {
          text: 'Dessert (100g serving)',
          align: 'start',
          value: 'name',
        },
        { text: 'Calories', value: 'calories' },
        { text: 'Fat (g)', value: 'fat' },
        { text: 'Carbs (g)', value: 'carbs' },
        { text: 'Protein (g)', value: 'protein' },
        { text: 'Iron (%)', value: 'iron' },
      ],
      desserts: [
        {
          id: 1,
          name: 'Frozen Yogurt',
          calories: 159,
          fat: 6.0,
          carbs: 24,
          protein: 4.0,
          iron: '1%',
        },
        {
          id: 2,
          name: 'Ice cream sandwich',
          calories: 237,
          fat: 9.0,
          carbs: 37,
          protein: 4.3,
          iron: '1%',
        },
        {
          id: 3,
          name: 'Eclair',
          calories: 262,
          fat: 16.0,
          carbs: 23,
          protein: 6.0,
          iron: '7%',
        },
        {
          id: 4,
          name: 'Cupcake',
          calories: 305,
          fat: 3.7,
          carbs: 67,
          protein: 4.3,
          iron: '8%',
        },
        {
          id: 5,
          name: 'Gingerbread',
          calories: 356,
          fat: 16.0,
          carbs: 49,
          protein: 3.9,
          iron: '16%',
        },
        {
          id: 6,
          name: 'Jelly bean',
          calories: 375,
          fat: 0.0,
          carbs: 94,
          protein: 0.0,
          iron: '0%',
        },
        {
          id: 7,
          name: 'Lollipop',
          calories: 392,
          fat: 0.2,
          carbs: 98,
          protein: 0,
          iron: '2%',
        },
        {
          id: 8,
          name: 'Honeycomb',
          calories: 408,
          fat: 3.2,
          carbs: 87,
          protein: 6.5,
          iron: '45%',
        },
        {
          id: 9,
          name: 'Donut',
          calories: 452,
          fat: 25.0,
          carbs: 51,
          protein: 4.9,
          iron: '22%',
        },
        {
          id: 10,
          name: 'KitKat',
          calories: 518,
          fat: 26.0,
          carbs: 65,
          protein: 7,
          iron: '6%',
        },
      ],
    }
  },
  methods: {
    getColor(calories) {
      if (calories > 400) return 'red'
      else if (calories > 200) return 'orange'
      else return 'green'
    },
    save() {
      this.snack = true
      this.snackColor = 'success'
      this.snackText = 'Data saved'
    },
    cancel() {
      this.snack = true
      this.snackColor = 'error'
      this.snackText = 'Canceled'
    },
    open() {
      this.snack = true
      this.snackColor = 'info'
      this.snackText = 'Dialog opened'
    },
  },
}
</script>
