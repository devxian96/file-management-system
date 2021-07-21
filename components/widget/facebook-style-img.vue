<template>
  <div v-if="len !== 0" class="w-100">
    <!-- 1~2개의 이미지 -->
    <template v-if="len < 3">
      <v-img
        v-for="src in imgs"
        :key="src"
        :src="src"
        :lazy-src="overlay"
        width="100%"
        :max-height="maxHeight / len"
        class="img"
        @click="overlay = src"
      />
      <!-- overay 이미지 -->
      <v-overlay :value="overlay !== ''">
        <div class="text-right">
          <v-btn icon @click="overlay = ''">
            <v-icon>fa-times</v-icon>
          </v-btn>
        </div>
        <v-row dense>
          <v-img
            :src="overlay"
            :lazy-src="overlay"
            width="auto"
            height="100%"
            max-height="85vh"
            class="img"
            @click="overlay = ''"
          />
        </v-row>
      </v-overlay>
    </template>

    <!-- 3개 이상의 이미지 -->
    <template v-else>
      <v-row dense>
        <v-col cols="6" class="col-custom">
          <v-img
            :src="imgs[0]"
            :lazy-src="imgs[0]"
            width="100%"
            :max-height="maxHeight / 2"
            class="img"
            @click="overlay = true"
          />
          <v-img
            :src="imgs[1]"
            :lazy-src="imgs[1]"
            width="100%"
            :max-height="maxHeight / 2"
            class="img"
            @click="overlay = true"
          />
        </v-col>
        <v-col cols="6" class="col-custom">
          <v-img
            :src="imgs[2]"
            :lazy-src="imgs[2]"
            width="100%"
            :max-height="maxHeight"
            height="100%"
            class="img"
            @click="overlay = true"
          />
          <v-overlay
            v-if="len > 3"
            absolute
            opacity="0.6"
            class="custom-clickable-img"
          >
            <div class="overay-custom" @click="overlay = true">
              <h1>+{{ len - 2 }}장</h1>
            </div>
          </v-overlay>
        </v-col>
      </v-row>

      <!-- overay 이미지 -->
      <v-overlay :value="overlay !== ''">
        <div class="text-right">
          <v-btn icon @click="overlay = ''">
            <v-icon>fa-times</v-icon>
          </v-btn>
        </div>
        <v-row dense class="w-100">
          <v-carousel
            continuous
            hide-delimiters
            height="100%"
            @change="page = $event"
          >
            <v-carousel-item v-for="(src, index) in imgs" :key="index">
              <v-img
                :src="src"
                :lazy-src="src"
                width="100%"
                height="100%"
                max-height="80vh"
                class="img"
                @click="overlay = ''"
              />
            </v-carousel-item>
          </v-carousel>
        </v-row>
        <div class="text-right">{{ page + 1 }} / {{ len }}</div>
      </v-overlay>
    </template>
  </div>
</template>

<script>
export default {
  props: {
    imgs: {
      type: Array,
      default() {
        return []
      },
    },
  },
  data() {
    return {
      len: this.imgs.length,
      maxHeight: 500,
      overlay: '',
      page: 0,
    }
  },
  watch: {
    page() {
      if (this.page > this.len) {
        this.page = 1
      }
    },
  },
}
</script>

<style scoped>
.w-100 {
  width: 100%;
}
.img {
  border: 1px solid black;
}
.col-custom {
  padding: 0 !important;
  position: relative;
}

.custom-clickable-img >>> .v-overlay__content,
.overay-custom {
  width: 100%;
  height: 100%;
}
.overay-custom {
  text-align: center;
}
.overay-custom > h1 {
  display: grid;
  align-items: center;
  height: 100%;
}
</style>
