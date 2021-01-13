<template>
  <div class="container">
    <div class="row">
      <div class="col-sm-10">
        <h1>Eleves</h1>
        <hr><br><br>
        <alert :message=message v-if="showMessage"></alert>
        <p> Totale : {{ students.length }}</p>
        <br><br>
        <p> la moyenne : {{ students.length }}</p>
        <button type="button" class="btn btn-success btn-sm" v-b-modal.book-modal> Ajouté un eleve</button>
        <br><br>
        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">Prenom</th>
              <th scope="col">Nom</th>
              <th scope="col">Date de naissance</th>
              <th scope="col">Note 1</th>
              <th scope="col">Note 2</th>
              <th scope="col">Note 3</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
           
            <tr v-for="(student, index) in students" :key="index">

              <td>{{ student.prenom }}</td>
              <td>{{ student.nom }}</td>
              <td>{{ student.birthDate }}</td>
              <td>{{ student.mark_1 }}</td>
              <td>{{ student.mark_2 }}</td>
              <td>{{ student.mark_3 }}</td>

              <td>
                <div class="btn-group" role="group">
                  <button
                          type="button"
                          class="btn btn-warning btn-sm"
                          v-b-modal.book-update-modal
                          @click="editStudent(student)">
                      Update
                  </button>
                  <button
                          type="button"
                          class="btn btn-danger btn-sm"
                          @click="onDeleteStudent(student)">
                      Delete
                  </button>
                </div>
              </td>
            </tr>

          </tbody>
        </table>
      </div>
    </div>
    <b-modal ref="addStudentModal"
            id="book-modal"
            title="Ajouté un nouveau éleve "
            hide-footer>
      <b-form @submit="onSubmit" @reset="onReset" class="w-100">
      <b-form-group id="form-title-group"
                    label="Prenom:"
                    label-for="form-title-input">
          <b-form-input id="form-title-input"
                        type="text"
                        v-model="addStudentForm.prenom"
                        required
                        placeholder="Michel">
          </b-form-input>
        </b-form-group>
        <b-form-group id="form-author-group"
                      label="Nom:"
                      label-for="form-author-input">
            <b-form-input id="form-author-input"
                          type="text"
                          v-model="addStudentForm.nom"
                          required
                          placeholder="Francois">
            </b-form-input>
          </b-form-group>

          <b-form-group id="form-title-date"
                    label="Date de Naissance:"
                    label-for="form-title-input">
          <b-form-input id="form-title-input"
                        type="text"
                        v-model="addStudentForm.birthDate"
                        required
                        placeholder="01/02/1990">
          </b-form-input>
        </b-form-group>
        <b-form-group id="form-title-note 1"
                    label="Note 1 :"
                    label-for="form-title-input">
          <b-form-input id="form-title-input"
                        type="text"
                        v-model="addStudentForm.mark_1"
                        required
                        placeholder="15">
          </b-form-input>
        </b-form-group>
        <b-form-group id="form-title-note 2"
                    label="Note 2 :"
                    label-for="form-title-input">
          <b-form-input id="form-title-input"
                        type="text"
                        v-model="addStudentForm.mark_2"
                        required
                        placeholder="15">
          </b-form-input>
        </b-form-group>
       <b-form-group id="form-title-note 3"
                    label="Note 3 :"
                    label-for="form-title-input">
          <b-form-input id="form-title-input"
                        type="text"
                        v-model="addStudentForm.mark_3"
                        required
                        placeholder="57">
          </b-form-input>
        </b-form-group>

        <b-button-group>
          <b-button type="submit" variant="primary">Submit</b-button>
          <b-button type="reset" variant="danger">Reset</b-button>
        </b-button-group>
      </b-form>
    </b-modal>
    <b-modal ref="editStudentModal"
            id="book-update-modal"
            title="Update"
            hide-footer>
      <b-form @submit="onSubmitUpdate" @reset="onResetUpdate" class="w-100">
      <b-form-group id="form-title-edit-group"
                    label="Prenom:"
                    label-for="form-title-edit-input">
          <b-form-input id="form-title-edit-input"
                        type="text"
                        v-model="editForm.prenom"
                        required
                        placeholder="Enter title">
          </b-form-input>
        </b-form-group>
        <b-form-group id="form-author-edit-group"
                      label="Nom:"
                      label-for="form-author-edit-input">
            <b-form-input id="form-author-edit-input"
                          type="text"
                          v-model="editForm.nom"
                          required
                          placeholder="Enter author">
            </b-form-input>
          </b-form-group>
          <b-form-group id="form-author-edit-group"
                      label="Date De Naissance:"
                      label-for="form-author-edit-input">
            <b-form-input id="form-author-edit-input"
                          type="text"
                          v-model="editForm.birthDate"
                          required
                          placeholder="Enter author">
            </b-form-input>
          </b-form-group>
          <b-form-group id="form-author-edit-group"
                      label="NOTE 1"
                      label-for="form-author-edit-input">
            <b-form-input id="form-author-edit-input"
                          type="text"
                          v-model="editForm.mark_1"
                          required
                          placeholder="Enter author">
            </b-form-input>
          </b-form-group>
          <b-form-group id="form-author-edit-group"
                      label="NOTE 2 :"
                      label-for="form-author-edit-input">
            <b-form-input id="form-author-edit-input"
                          type="text"
                          v-model="editForm.mark_2"
                          required
                          placeholder="Enter author">
            </b-form-input>
          </b-form-group>
          <b-form-group id="form-author-edit-group"
                      label="NOTE 3:"
                      label-for="form-author-edit-input">
            <b-form-input id="form-author-edit-input"
                          type="text"
                          v-model="editForm.mark_3"
                          required
                          placeholder="Enter author">
            </b-form-input>
          </b-form-group>
        
        <b-button-group>
          <b-button type="submit" variant="primary">Update</b-button>
          <b-button type="reset" variant="danger">Cancel</b-button>
        </b-button-group>
      </b-form>
    </b-modal>
  </div>
</template>



<script>

import axios from 'axios';
import Alert from './Alert.vue';

export default {

  data() {
    return {
      students: [],
      message: '',
      showMessage: false,      

      addStudentForm: {
        prenom: '',
        nom: '',
        birthDate: '',
        mark_1:'',
        mark_2:'',
        mark_3:''
      },

      editForm: {
        id: '',
        prenom: '',
        nom: '',
        birthDate: '',
        mark_1: '',
        mark_2:'',
        mark_3:''
      },

    };
  },
  components: {
    alert: Alert,
  },

  methods: {
    getStudents() {
      const path = 'http://localhost:5000/';
      axios.get(path)
        .then((res) => {
          this.students = JSON.parse(res.data);
        })
        .catch((error) => {
          // eslint-disable-next-line
          console.error(error);
        });
    },
    addStudent(payload) {
      const path = 'http://localhost:5000/insert';
      axios.post(path, payload)
        .then(() => {
          this.getStudents();
          this.message = 'Eleve ajouté !';
          this.showMessage = true;
        })
        .catch((error) => {
          // eslint-disable-next-line
          console.log(error);
          this.getStudents();
        });
    },
    initForm() {
      
      this.addStudentForm.prenom = '';
      this.addStudentForm.nom = '';
      this.addStudentForm.birthDate = '';
      this.addStudentForm.mark_1 = '';
      this.addStudentForm.mark_2 = '';
      this.addStudentForm.mark_3 = '';            
      
      this.editForm.id = '';
      this.editForm.prenom = '';
      this.editForm.nom = '';
      this.editForm.birthDate = '';
      this.editForm.mark_1 = '';
      this.editForm.mark_2 = '';
      this.editForm.mark_3 = '';
    },
    onSubmit(evt) {
      evt.preventDefault();
      this.$refs.addStudentModal.hide();
      // let read = false;
      // if (this.addStudentForm.read[0]) read = true;
      const payload = {
        
        prenom: this.addStudentForm.prenom,
        nom: this.addStudentForm.nom,
        birthDate: this.addStudentForm.birthDate,
        mark_1: this.addStudentForm.mark_1,
        mark_2: this.addStudentForm.mark_2,
        mark_3: this.addStudentForm.mark_3
        
        // read, // property shorthand
      };
      this.addStudent(payload);
      this.initForm();
    },
    onReset(evt) {
      evt.preventDefault();
      this.$refs.addStudentModal.hide();
      this.initForm();
    },
    editstudent(student) {
      this.editForm = student;
    },

    onSubmitUpdate(evt) {
      evt.preventDefault();
      this.$refs.editStudentModal.hide();
      // let read = false;
      // if (this.editForm.read[0]) read = true;
      const payload = {
        prenom: this.editForm.prenom,
        nom: this.editForm.nom,
        birthDate: this.editForm.birthDate,
        mark_1: this.editForm.mark_1,
        mark_2: this.editForm.mark_2,
        mark_3: this.editForm.mark_3
         };
      console.log("this is the id"+this.editForm.id)
      this.updateStudent(payload, this.editForm.id);
    },

    updateStudent(payload, StudentID) {
      const path = `http://localhost:5000/update/${StudentID}`;
      axios.post(path, payload)
        .then(() => {
          this.getStudents();
          this.message = 'Eleve modifie !';
          this.showMessage = true;
        })
        .catch((error) => {
          // eslint-disable-next-line
          console.error(error);
          this.getStudents();
        });
    },
    onResetUpdate(evt) {
      evt.preventDefault();
      this.$refs.editStudentModal.hide();
      this.initForm();
      this.getStudents(); // why?
    },


    removeStudent(StudentID) {
      const path = `http://localhost:5000/delete/${StudentID}`;
      axios.post(path)
        .then(() => {
          this.getStudents();
          this.message = 'Eleve supprimé !';
          this.showMessage = true;
        })
        .catch((error) => {
          // eslint-disable-next-line
          console.error(error);
          this.getStudents();
        });
    },
    onDeleteStudent(student) {
      this.removeStudent(student.id);
    },
  },
  created() {
    this.getStudents();
  },
};
</script>
