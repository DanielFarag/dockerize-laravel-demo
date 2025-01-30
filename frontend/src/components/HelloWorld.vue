<script>
export default {
    data() {
      return {
        data: [],
        loading: false,
      };
    },
    methods: {
      async fetchData() {      

        this.loading = true;
        try {
          const response = await fetch('/api/users');
          this.data = await response.json();
        } catch (error) {
          console.error('Error fetching data:', error);
        } finally {
          this.loading = false;
        }
        
      }   
    }
  };

</script>

<template>
  <div class="greetings">
    <div>
      <button @click="fetchData">Fetch Data</button>
      <div v-if="loading">Loading...</div>
      <div v-else>
        <ul>
          <li v-for="item in data" :key="item.id">{{ item.name }}</li>
        </ul>
      </div>
    </div>
  </div>
</template>

<style scoped>
h1 {
  font-weight: 500;
  font-size: 2.6rem;
  position: relative;
  top: -10px;
}

h3 {
  font-size: 1.2rem;
}

.greetings h1,
.greetings h3 {
  text-align: center;
}

@media (min-width: 1024px) {
  .greetings h1,
  .greetings h3 {
    text-align: left;
  }
}
</style>
